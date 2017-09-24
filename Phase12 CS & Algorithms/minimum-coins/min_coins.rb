class MinimumCoins

  def self.count(number)
    if number <= 250
      currency = [100, 50, 25, 10, 5, 1]
      coin_return = []

      currency.each do |coin|
        while number >= coin
          coin_return.push(coin)
          number -= coin
        end
      end

      return coin_return
    else
      return "Please input a number between 1 and 250"
    end
  end
end
