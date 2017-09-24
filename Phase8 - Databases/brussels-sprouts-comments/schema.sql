CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  ingredients TEXT NOT NULL,
  directions TEXT NOT NULL
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  comments TEXT NOT NULL,
  recipe_id INT REFERENCES recipes(id)
);
