class House
  attr_reader :asking_price, :address, :city, :state, :zip

  def initialize(asking_price, address, city, state, zip)
    @asking_price = asking_price
    @address = address
    @city = city
    @state = state
    @zip = zip
  end
end
