CREATE TABLE employees (
  emp_id SERIAL PRIMARY KEY,
  name VARCHAR(75) NOT NULL UNIQUE
);

CREATE TABLE products (
  prod_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE sales (
  sale_id SERIAL PRIMARY KEY,
  emp_id INT REFERENCES employees(emp_id),
  prod_id INT REFERENCES products(prod_id),
  customer VARCHAR(255) NOT NULL,
  sale_date DATE NOT NULL,
  sale_amount MONEY NOT NULL,
  units_sold INT NOT NULL,
  invoice_num INT NOT NULL,
  invoice_frequency VARCHAR(50)
);
