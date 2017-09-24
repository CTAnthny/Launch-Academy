class Recipe
  attr_accessor :name, :instructions, :ingredients

  def initialize(name, instructions = [], ingredients = [])
    @recipe_name = name
    @instructions = instructions
    @ingredients = ingredients
  end

  def summary
    puts "Name: #{@recipe_name}\n\n"
    puts "Ingredients: \n\n"
    @ingredients.each { |ingredient| puts "- #{ingredient.summary}" }
    puts "\nInstructions: \n\n"
    @instructions.each_with_index { |instruction, index| puts "#{index + 1}. #{instruction}" }
    return
  end
end

class Ingredient
  attr_accessor :quantity, :unit, :name

  def initialize(quantity, unit, name)
    @quantity = quantity.to_f
    @unit = unit
    @ingredient_name = name
  end

  def summary
    "#{@quantity} #{@unit} #{@ingredient_name}"
  end
end

name = "Roasted Brussels Sprouts"

ingredients = [
    Ingredient.new(1.5, "lb(s)", "Brussels sprouts"),
    Ingredient.new(3.0, "tbspn(s)", "Good olive oil"),
    Ingredient.new(0.75, "tspn(s)", "Kosher salt"),
    Ingredient.new(0.5, "tspn(s)", "Freshly ground black pepper")
]

instructions = [
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

recipe = Recipe.new(name, instructions, ingredients)
puts recipe.summary
