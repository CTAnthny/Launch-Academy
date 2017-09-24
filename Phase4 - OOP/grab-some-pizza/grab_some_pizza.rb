class Pizza

  MEATS = [:sausage, :pepperoni, :bacon]
  OTHER_TOPPINGS = [:cheese, :green_pepper, :onion, :mushroom, :jalapeno]
  AVAILABLE_INGREDIENTS = [:pepperoni, :bacon, :sausage, :mushroom, :onion, :jalapeno, :green_pepper]
  TOPPINGS_COST = { cheese: 0.10, green_pepper: 0.30, onion: 0.50, mushroom: 0.70, pepperoni: 1.10, jalapeno: 1.30, sausage: 1.70, bacon: 1.90 }

  def initialize(type = :cheese)
    @type = type
    @cost = nil
  end

attr_reader :type, :cost, :MEATS, :OTHER_TOPPINGS, :AVAILABLE_INGREDIENTS, :TOPPINGS_COST

  def make_combination!
    #set random .times to sample ingredients, then mutate @type
    @type = []
    rand(AVAILABLE_INGREDIENTS.size).times do
      ingredient_to_add = AVAILABLE_INGREDIENTS.sample
      if !@type.include?(ingredient_to_add)
        @type << ingredient_to_add
      end
    end
    #output type
    puts "Here is your #{@type.join(", ")} pizza!"
  end

  def cost
    if @type == :cheese
      @cost = 8.10
    else
      @cost = 8.00
      TOPPINGS_COST.each do |topping, price|
        if @type.include?(topping)
          @cost += price
        end
      end
    puts "Your pizza cost is $#{@cost}0."
    end
  end

  def meats
    #output meats in the @type array
    @type.select { |ingredient| MEATS.include?(ingredient) }
  end

  def other_toppings
    #output veggies in the @type array
    @type.select { |ingredient| OTHER_TOPPINGS.include?(ingredient) }
  end

  def self.show_toppings
    AVAILABLE_INGREDIENTS
  end
end
