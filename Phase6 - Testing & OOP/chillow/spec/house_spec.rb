require_relative "spec_helper.rb"

describe House do
  describe "#initialize" do
    it "initializes a house with an asking price, address, city, state, and zip code" do
      chill_house = House.new(250_000, "1340 Sharon Lakes", "Charlotte", "NC", 28275)

      expect(chill_house.asking_price).to eq(250_000)
      expect(chill_house.address).to eq("1340 Sharon Lakes")
      expect(chill_house.city).to eq("Charlotte")
      expect(chill_house.state).to eq("NC")
      expect(chill_house.zip).to eq(28275)
    end
  end
end
