require 'pry'

class Ingredient
  SAFE_INGREDIENTS = [
    "brussels sprouts",
    "spinach",
    "eggs",
    "milk",
    "tofu",
    "seitan",
    "bell peppers",
    "quinoa",
    "kale",
    "chocolate",
    "beer",
    "wine",
    "whiskey"
  ]
  attr_accessor :unit, :quantity, :ingredient_name

  def initialize(unit, quantity, ingredient_name)
    @unit, @quantity, @ingredient_name = unit, quantity, ingredient_name
  end

  def ingredient_safe?
    SAFE_INGREDIENTS.include?(@ingredient_name.downcase)
  end

  def self.parse(ingredient_string)
    #format in quantity, unit, name
    string_array = ingredient_string.split(" ")
    unit = string_array[0]
    quantity = string_array[1]
    ingredient_name = string_array[2]
    self.new(unit, quantity, ingredient_name)
  end
end

class Recipe
  attr_accessor :recipe_name, :ingredients, :instructions

  def initialize(recipe_name, ingredients = [], instructions = [])
    @recipe_name, @ingredients, @instructions = recipe_name, ingredients, instructions
  end

  def recipe_safe?
    @ingredients.all? { |ingredient| ingredient.ingredient_safe? }
  end
end

safe_name = "Chocolate Quinoa"

safe_ingredients = [
        Ingredient.new(1.0, "cup", "Quinoa"),
        Ingredient.new(1.0, "cup", "Chocolate")
]

safe_instructions = [
        "Melt chocolate.",
        "Pour over quinoa.",
        "Regret your life."
]

#safe_recipe test
safe_recipe = Recipe.new(safe_name, safe_ingredients, safe_instructions)
puts "Is #{safe_name} recipe safe? #{safe_recipe.recipe_safe?}"

#new ingredient test
rum = Ingredient.new(1.0, "cup", "rum")
puts "Is #{rum::ingredient_name} safe? #{rum.ingredient_safe?}"

#parse ingredient test
orange = Ingredient.parse("2 lbs orange")
puts "Is #{orange::ingredient_name} safe? #{orange.ingredient_safe?}"

#new recipe test
brussels_recipe_name = "Roasted Brussels Sprouts"

brussels_ingredients = ingredients = [
    Ingredient.new(1.5, "lb(s)", "Brussels sprouts"),
    Ingredient.new(3.0, "tbspn(s)", "Good olive oil"),
    Ingredient.new(0.75, "tspn(s)", "Kosher salt"),
    Ingredient.new(0.5, "tspn(s)", "Freshly ground black pepper")
]

brussels_instructions = instructions = [
    "Preheat oven to 400 degrees F.",
    "Cut off the brown ends of the Brussels sprouts.",
    "Pull off any yellow outer leaves.",
    "Mix them in a bowl with the olive oil, salt and pepper.",
    "Pour them on a sheet pan and roast for 35 to 40 minutes.",
    "They should be until crisp on the outside and tender on the inside.",
    "Shake the pan from time to time to brown the sprouts evenly.",
    "Sprinkle with more kosher salt ( I like these salty like French fries).",
    "Serve and enjoy!"
]

brussels_recipe = Recipe.new(brussels_recipe_name, brussels_ingredients, brussels_instructions)
puts "Is #{brussels_recipe_name} recipe safe? #{brussels_recipe.recipe_safe?}"
