require 'spec_helper'

describe MinimumCoins do
  describe ".count" do
    context "given '35'" do
      it "returns 2 coins: '10 and 25' in an array" do
        expect(MinimumCoins.count(35)).to match_array([10, 25])
      end
    end

    context "given '37'" do
      it "returns 4 coins: '1, 1, 10 and 25' in an array" do
        expect(MinimumCoins.count(37)).to match_array([1, 1, 10, 25])
      end
    end

    context "given '101'" do
      it "returns 2 coins: '1 and 100' in an array" do
        expect(MinimumCoins.count(101)).to match_array([1, 100])
      end
    end
  end
end
