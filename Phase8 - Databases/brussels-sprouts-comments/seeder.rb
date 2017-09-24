require 'pg'
require 'faker'
require 'pry'

TITLES = [
  "Roasted Brussels Sprouts",
  "Fresh Brussels Sprouts Soup",
  "Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon",
  "Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries",
  "Hot Cheesy Roasted Brussels Sprout Dip",
  "Pomegranate Roasted Brussels Sprouts with Red Grapes and Farro",
  "Roasted Brussels Sprout and Red Potato Salad",
  "Smoky Buttered Brussels Sprouts",
  "Sweet and Spicy Roasted Brussels Sprouts",
  "Smoky Buttered Brussels Sprouts",
  "Brussels Sprouts and Egg Salad with Hazelnuts",
  "Brussels Sprouts with Goat Cheese"
]

FOOD_STUFFS = [
  "Broth", "Breadcrumbs", "Parmesan", "Lemon", "Cheddar Cheese",
  "Red Grapes", "Farro Cheese", "Sliced Red Potatoes", "Butter",
  "Boiled Egg", "Lettuce", "Mixed Greens", "Hazelnuts", "Goat Cheese",
  "Olive Oil", "Pomegranate", "Dried Cherries"
]

SPICES = [
  "Kosher Salt", "Black Pepper", "Cayenne Pepper", "Oregano", "Garlic"
]

MEASUREMENTS = [
  "1/2 Teaspoon", "3/4 Teaspoon", "2 Tablespoons", "1 Tablespoon"
]


def db_connection
  begin
    connection = PG.connect(dbname: "brussels_sprouts_recipes")
    yield(connection)
  ensure
    connection.close
  end
end

def make_random_ingredients_list
  random_amount = (rand(2) + 1)
  ingredients = []
  (rand(3) + 1).times { ingredients.push("#{random_amount}" + " #{FOOD_STUFFS.sample}") }
  (rand(2) + 1).times { ingredients.push("#{MEASUREMENTS.sample}" + " #{SPICES.sample}") }
  ingredients.join(", ")
end

def make_random_directions
  directions = []
  (rand(6) + 3).times { directions.push("#{Faker::Hipster.sentence}") }
  directions.join(", ")
end

def make_random_comments
  comments = []
  (rand(4) + 1).times { comments.push("#{Faker::Hipster.paragraph}") }
  comments.join(", ")
end

TITLES.each do |recipe_title|
  ingredients = make_random_ingredients_list
  directions = make_random_directions
  db_connection do |conn|
    insert_recipe_query = %(
      INSERT INTO recipes (name, ingredients, directions)
      VALUES ($1, $2, $3)
    )
    recipe_data = ["#{recipe_title}", "#{ingredients}", "#{directions}"]
    conn.exec_params(insert_recipe_query, recipe_data)

    # find the ID of the recipe that you just inserted
    recipe_id_query = %(
      SELECT id FROM recipes WHERE name = $1 AND ingredients = $2 AND directions = $3
    )
    recipe = conn.exec_params(recipe_id_query, recipe_data)
    recipe_id = recipe.first["id"]

    insert_comments_query = %(
      INSERT INTO comments (comments, recipe_id)
      VALUES ($1, $2)
    )
    comments_data = ["#{make_random_comments}", "#{recipe_id}"]
    conn.exec_params(insert_comments_query, comments_data)
  end
end

# def make_random_ingredients
#   random_amount = (rand(2) + 1)
#   ingredients = []
#   (rand(3) + 1).times { ingredients.push("#{random_amount} + #{Faker::Food.ingredient}") }
#   (rand(2) + 1).times { ingredients.push("#{Faker::Food.measurement} + #{Faker::Food.spice}") }
#   ingredients.join(", ")
# end
