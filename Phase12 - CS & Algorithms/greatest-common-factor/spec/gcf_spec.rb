require_relative "../lib/gcf"

describe GreatestCF do
  subject(:gcf) { GreatestCF.new }
  describe "#compute" do
    it "takes two numbers and returns the largest number that evenly divides both" do
      expect(gcf.compute(8, 4)).to eq(4)
      expect(gcf.compute(8, 7)).to eq(1)
      expect(gcf.compute(81, 18)).to eq(9)
      expect(gcf.compute(788, 288)).to eq(4)
    end
  end
end
