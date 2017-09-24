require "pg"
require 'pry'
require 'csv'

def db_connection
  begin
    connection = PG.connect(dbname: "korning")
    yield(connection)
  ensure
    connection.close
  end
end

def get_csv_data
  @sales_records = []
  CSV.foreach('sales.csv', headers:true, header_converters: :symbol) do |row|
    @sales_records << row.to_hash
  end
end

def push_data_to_pg
  @sales_records.each do |record|
    employee_name = record[:employee]
    customer = record[:customer_and_account_no]
    product = record[:product_name]
    sale_date = record[:sale_date]
    sale_amount = record[:sale_amount]
    units_sold = record[:units_sold]
    invoice_num = record[:invoice_no]
    invoice_freq = record[:invoice_frequency]

    db_connection do |conn|
      #check duplicate employee
      check_duplicate_employee_query = %(
        SELECT * FROM employees WHERE name LIKE ($1)
      )
      employee_name_data = [employee_name]
      check_duplicate_employee_result = conn.exec_params(check_duplicate_employee_query, employee_name_data)

      # seed employees table if name does not exist
      if check_duplicate_employee_result.to_a.empty?
        insert_employee_name_query = %(
          INSERT INTO employees (name)
          VALUES ($1)
        )
        conn.exec_params(insert_employee_name_query, employee_name_data)
      end

      # check duplicate product
      check_duplicate_product_query = %(
        SELECT * FROM products WHERE name LIKE ($1)
      )
      product_name_data = [product]
      check_duplicate_product_result = conn.exec_params(check_duplicate_product_query, product_name_data)

      # seed products table if name does not exit
      if check_duplicate_product_result.to_a.empty?
        insert_product_name_query = %(
          INSERT INTO products (name)
          VALUES ($1)
        )
        conn.exec_params(insert_product_name_query, product_name_data)
      end

      # get employee id
      employee_id_query = %(
        SELECT emp_id FROM employees WHERE name = $1
      )
      employee_id_query_data = [employee_name]
      employee_id = conn.exec_params(employee_id_query, employee_id_query_data)
      emp_id = employee_id.first["emp_id"]

      # get product id
      product_id_query = %(
        SELECT prod_id FROM products WHERE name = $1
      )
      product_id_query_data = [product]
      product_id = conn.exec_params(product_id_query, product_id_query_data)
      prod_id = product_id.first["prod_id"]

      # seed sales table
      insert_sales_query = %(
        INSERT INTO sales (emp_id, prod_id, customer, sale_date, sale_amount, units_sold, invoice_num, invoice_frequency)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
      )
      sales_data = [emp_id, prod_id, customer, sale_date, sale_amount, units_sold, invoice_num, invoice_freq]
      conn.exec_params(insert_sales_query, sales_data)
    end
  end
end

get_csv_data
push_data_to_pg
