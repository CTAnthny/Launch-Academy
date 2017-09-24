require_relative "../lib/mci"

describe MinimumCI do
  subject(:mci) { MinimumCI.new }
  describe "#compute" do
    it "takes an array of integers and returns the minimum number of integers to make the array consecutive" do
      # requires "2"
      expect(mci.compute([1, 3])).to eq(1)
      # requires "3" and "4"
      expect(mci.compute([2, 5])).to eq(2)
      # requires "0" through "3"
      expect(mci.compute([-1, 4])).to eq(4)
    end
  end
end
