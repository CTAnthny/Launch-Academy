require_relative "spec_helper.rb"

describe Truck do
  let(:my_truck) { Truck.new(20) }
  let(:my_semi_full_truck) { Truck.new(20) }
  let(:my_full_truck) { Truck.new(20) }

  before(:each) do
    10.times do
      my_semi_full_truck.add("Sam Adams")
    end

    20.times do
      my_full_truck.add("Sam Adams")
    end
  end

  describe "#initialize" do
    it "initializes a truck with box capacity" do
      expect(my_truck.box_capacity).to eq(20)
    end
  end

  describe "#full?" do
    it "returns true if the truck is full of boxes" do
      expect(my_full_truck).to be_full
    end

    it "returns false if the truck is not full of boxes" do
      expect(my_semi_full_truck).to_not be_full
    end
  end

  describe "#add" do
    it "adds a box to the truck" do
      my_truck.add("Sam Adams")
      expect(my_truck.boxes_held.size).to eq(1)
    end

    it "returns an error message if the truck is full" do
      expect(my_full_truck.add("Sam Adams")).to eq("The truck is full!")
    end
  end

  describe "#remove!" do
    it "removes a box from the truck" do
      expect(my_semi_full_truck.remove).to be_instance_of(Box)
    end
  end

  describe "#unload_boxes!" do
    it "removes all boxes from the truck" do
      my_semi_full_truck.unload_boxes!("Sam Adams")
      expect(my_semi_full_truck.boxes_held.size).to eq(0)
    end

    it "only removes boxes from the truck of specified owner" do
      5.times do
        my_semi_full_truck.add("John Maycock")
      end

      my_semi_full_truck.unload_boxes!("Sam Adams")
      expect(my_semi_full_truck.boxes_held.size).to eq(5)
    end
  end
end
