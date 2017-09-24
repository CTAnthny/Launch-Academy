require 'spec_helper'

describe ElementCounter do
  describe ".duplicates" do
    context "given an array '[1, 7, 7, 7, 3, 5]'" do
      it "returns 2" do
        expect(ElementCounter.duplicates([1, 7, 7, 7, 3, 5])).to eql(2)
      end
    end

    context "given an array '[5, 7, 9]'" do
      it "returns 0" do
        expect(ElementCounter.duplicates([5, 7, 9])).to eql(0)
      end
    end

    context "given an array '[0,-5,-5,33,33,33]'" do
      it "returns 3" do
        expect(ElementCounter.duplicates([0,-5,-5,33,33,33])).to eql(3)
      end
    end
  end
end
