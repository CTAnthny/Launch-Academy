RSpec.describe NesCartridge do
  subject(:cart) { NesCartridge.new("Tetris", "Tengen", 1988) }

  it "has a reader for title" do
    expect(cart.title).to eq("Tetris")
  end

  it "has a reader for developer" do
    expect(cart.developer).to eq("Tengen")
  end

  it "has a reader for year" do
    expect(cart.year).to eq(1988)
  end
end
