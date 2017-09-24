require_relative "spec_helper.rb"

describe Box do
  describe "#initialize" do
    it "initializes a box with an owner's name" do
      johns_box = Box.new("John Maycock")

      expect(johns_box.owner_name).to eq("John Maycock")
    end
  end
end
