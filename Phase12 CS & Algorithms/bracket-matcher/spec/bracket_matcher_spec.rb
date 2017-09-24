require_relative "../lib/bracket_matcher"

describe BracketMatcher do
  describe ".match" do
    it "correctly matches brackets in a string" do
      expect(BracketMatcher.match_check?("Hi! What is your name again (I forgot)?")).to be true
      expect(BracketMatcher.match_check?( "()()" )).to be true
    end

    it "does not match asymmetrical brackets" do
      expect(BracketMatcher.match_check?("Hi! What is (your name again? I forgot")).to be false
      expect(BracketMatcher.match_check?( "()(" )).to be false
    end
  end
end
