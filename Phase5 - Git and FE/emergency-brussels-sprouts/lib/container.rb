require_relative "ingredient.rb"

class Container
  attr_reader :weight, :maximum_holding_weight, :ingredients

  def initialize(weight, maximum_holding_weight)
    @weight = weight
    @maximum_holding_weight = maximum_holding_weight
    @ingredients = []
  end

  def fill_with_ingredient(ingredient)
    #add ingredient name to container ingredients list
    # @ingredients << ingredient.instance_variable_get("@name")
    ingredient_name = ingredient.instance_variable_get("@name")

    #get ingredient weight and amount of ingredient to fill container
    ingredient_weight = ingredient.instance_variable_get("@weight")
    @amount_of_ingredient = @maximum_holding_weight / ingredient_weight.to_f

    #push to ingredients array the amount of ingredients container can hold
    @amount_of_ingredient.to_i.times do
      @ingredients.push(ingredient_name)
    end

    #set container weight
    total_ingredients_weight = @amount_of_ingredient * ingredient_weight
    @weight = @weight + total_ingredients_weight
  end

  def which_ingredient
    @ingredients[0]
  end

  def how_many_ingredients
    @ingredients.count
  end

  def remove_one_ingredient
    @ingredients.pop
  end

  def empty
    @ingredients = []
  end
end

# brussels_container = Container.new(90, 140)
# cheesy_container = Container.new(20, 10)

# one_brussel_sprout = Ingredient.new("Brussels Sprouts", 0.02)
# one_cheesy_poof = Ingredient.new("Cheesy Poof", 0.0005)
