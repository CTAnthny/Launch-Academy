require_relative "../lib/c_cipher"

describe CaesarCipher do
  subject(:cipher) { CaesarCipher.new }
  describe "#encode" do
    it "encodes a string character x spots down the alphabet" do
      expect(cipher.encode("a", 2)).to eq("c")
      expect(cipher.encode("z", 2)).to eq("b")
      expect(cipher.encode("n", 53)).to eq("o")
    end

    it "encodes a string sentence x spots down the alphabet" do
      expect(cipher.encode("Caesar", 2)).to eq("Ecguct")
      expect(cipher.encode("You're welcome", 1)).to eq("Zpv'sf xfmdpnf")
      expect(cipher.encode("Wait, come here", 1)).to eq("Xbju, dpnf ifsf")
      expect(cipher.encode("FREE LOVE?", 13)).to eq("SERR YBIR?")
      expect(cipher.encode("THE QUICK BROWN DOG JUMPED OVER THE LAZY FOX.", 13)).to eq("GUR DHVPX OEBJA QBT WHZCRQ BIRE GUR YNML SBK.")
    end
  end
end
