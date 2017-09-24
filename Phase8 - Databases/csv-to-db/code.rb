require 'pg'
require 'csv'
require 'pry'

def db_connection
  begin
    connection = PG.connect(dbname: "ingredients")
    yield(connection)
  ensure
    connection.close
  end
end

def get_csv_data
  @ingredients = []
  CSV.foreach('ingredients.csv', headers: true, header_converters: :symbol) do |row|
    @ingredients << row.to_hash
  end
end

def push_data_to_pg
  @ingredients.each do |ingredient|
    step = ingredient[:step]
    amount = ingredient[:amount]
    ingredient = ingredient[:ingredient]
    db_connection do |conn|
      insert_ingredient_query = %(
        INSERT INTO ingredients (step, amount, ingredient)
        VALUES ($1, $2, $3)
      )
      ingredient_data = [step, amount, ingredient]
      conn.exec_params(insert_ingredient_query, ingredient_data)
    end
  end
end

# get_csv_data
# push_data_to_pg

def pull_data_from_pg
  @results = db_connection do |conn|
    get_ingredients_query = %(
      SELECT * FROM ingredients
    )
    conn.exec(get_ingredients_query)
  end
end

def results_to_s
  result_string = ""
  @results.to_a.each do |result|
    result_string << "#{result["step"]}. #{result["amount"]}#{result["ingredient"]} \n"
  end
  result_string
end

pull_data_from_pg
puts results_to_s
