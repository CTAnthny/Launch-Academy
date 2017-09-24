require_relative "spec_helper.rb"

describe Apartment do
  let(:chill_place) { Apartment.new(900, "861 Hwy 51", "Pineville", "NC", 28275, 2, "31st July 2016", "31st July 2017") }

  describe "#initialize" do
    it "initializes an apartment with a rent price, address, city, state, zip code, occupancy size, lease start and lease end date" do
      expect(chill_place.rent_price).to eq(900)
      expect(chill_place.address).to eq("861 Hwy 51")
      expect(chill_place.city).to eq("Pineville")
      expect(chill_place.state).to eq("NC")
      expect(chill_place.zip).to eq(28275)
      expect(chill_place.occupancy_size).to eq(2)
      expect(chill_place.lease_start).to be_instance_of(Date)
      expect(chill_place.lease_end).to be_instance_of(Date)
    end
  end

  describe "#add_roommate" do
    it "adds a new occupant" do
      chill_place.add_roommate("John", "Maycock")
      expect(chill_place.residents[0]).to be_instance_of(Occupant)
    end
  end

  describe "#remove_roommate" do
    it "removes an occupant" do
      chill_place.add_roommate("John", "Maycock")
      chill_place.remove_roommate("John", "Maycock")
      expect(chill_place.residents.size).to eq(0)
    end
  end

  describe "#full" do
    it "returns false if there are empty spaces in the apartment" do
      expect(chill_place).to_not be_full
    end
    it "returns true if there are no empty spaces in the apartment" do
      chill_place.add_roommate("John", "Maycock")
      chill_place.add_roommate("Sam", "Adams")
      expect(chill_place).to be_full
    end
  end
end
