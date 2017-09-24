require "spec_helper"

describe Hand do
  # These UTF-8 characters will be useful for making different hands:
  # '♦', '♣', '♠', '♥'
  
  let(:hand) { Hand.new(["10♦", "J♥"]) }
  let(:face_hand) { Hand.new(["J♦", "J♠"]) }
  let(:low_hand) { Hand.new(["2♣", "2♠"]) }
  let(:ace_low_hand) { Hand.new(["4♦", "2♠", "A♣"]) }
  let(:ace_high_hand) { Hand.new(["10♣", "J♥", "A♦"]) }

  describe "#calculate_hand" do
    it "correctly calculates numbered cards" do
      expect(low_hand.calculate_hand).to eq(4)
    end
    it "correctly calculates two face cards" do
      expect(face_hand.calculate_hand).to eq(20)
    end
    it "correctly calculates a numbered and face card" do
      expect(hand.calculate_hand).to eq(20)
    end
    it "uses a low ace for a high hand" do
      expect(ace_low_hand.calculate_hand).to eq(17)
    end
    it "uses a high ace for a low hand" do
      expect(ace_high_hand.calculate_hand).to eq(21)
    end
  end
end
