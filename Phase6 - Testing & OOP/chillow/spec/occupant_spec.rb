require_relative "spec_helper.rb"

describe Occupant do
  describe "#initialize" do
    it "initializes an occupant with a first and last name" do
      resident_john = Occupant.new("John", "Maycock")

      expect(resident_john.first_name).to eq("John")
      expect(resident_john.last_name).to eq("Maycock")
    end
  end
end
