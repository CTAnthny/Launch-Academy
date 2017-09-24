class CoffeeCup
  attr_reader :filled_to, :capacity

  def initialize(filled_to = 8, capacity = 12)
    @filled_to = filled_to
    @capacity = capacity
  end

  def sip!(amount = 1)
    if @filled_to > 0
      @filled_to -= amount
    else
      puts "Hey! You need a refill!"
    end
  end

  def spill!
    @filled_to = 0
  end

  def refill!
    @filled_to = @capacity - 2
  end
end
