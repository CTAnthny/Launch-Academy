class Ingredient
  attr_reader :name, :weight

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  def self.create_from_grams(ingredient, weight)
    weight = weight / 1000.0
    Ingredient.new(ingredient, weight)
  end
end
