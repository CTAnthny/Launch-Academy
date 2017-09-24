require_relative "../spec/spec_helper.rb"

class Apartment
  include Adjuster
  attr_reader :rent_price, :address, :city, :state, :zip, :max_capacity, :lease_start, :lease_end, :occupants

  def initialize(rent_price, address, city, state, zip, max_capacity, lease_start, lease_end)
    @rent_price = rent_price
    @address = address
    @city = city
    @state = state
    @zip = zip
    @lease_start = Date.parse(lease_start)
    @lease_end = Date.parse(lease_end)
    @max_capacity = max_capacity
    @occupants = []
  end

  # vacant spaces?
  # def full?
  #   if @residents.size < @occupancy_size
  #     false
  #   else
  #     true
  #   end
  # end
  #
  # def add_roommate(first_name, last_name)
  #   @residents << Occupant.new(first_name, last_name)
  # end
  #
  # def remove_roommate(first_name, last_name)
  #   @residents.delete_if { |occupant| occupant.last_name == last_name }
  # end
end
