require 'pry'

class CookieInventory
  attr_accessor :inventory
  AVAILABLE_TYPES = [:peanut_butter, :chocolate_chip, :sugar]

  def initialize()
    @inventory = {}
  end

  def cook_batch!(cookie_type, cookie_count)
    if AVAILABLE_TYPES.include?(cookie_type.to_sym)
      @inventory[cookie_type.to_sym] = cookie_count
    else
      puts "Sorry! We can only make #{AVAILABLE_TYPES.join(", ")} cookies!"
    end
  end

  def sell!(cookie_type, cookies_sold)
    if @inventory.has_key?(cookie_type.to_sym) && cookies_sold <= @inventory[cookie_type.to_sym]
      cookie_count = @inventory[cookie_type.to_sym] - cookies_sold
      @inventory[cookie_type.to_sym] = cookie_count
    else
      puts "We do not have that in stock!"
    end
  end

  def call_self
    self::inventory
  end
end

my_cookies = CookieInventory.new
my_cookies.cook_batch!("chocolate_chip", 100)
my_cookies.sell!("chocolate_chip", 50)
puts my_cookies.call_self
binding.pry
