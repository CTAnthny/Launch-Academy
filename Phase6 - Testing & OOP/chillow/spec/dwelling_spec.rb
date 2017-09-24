require_relative "spec_helper.rb"

describe Dwelling do
  describe "#initialize" do
    it "initializes a dwelling with an address, city, state, and zip code" do
      chill_place = Dwelling.new("751 West St.", "Charlotte", "NC", 28275)

      expect(chill_place.address).to eq("751 West St.")
      expect(chill_place.city).to eq("Charlotte")
      expect(chill_place.state).to eq("NC")
      expect(chill_place.zip).to eq(28275)
    end
  end
end
