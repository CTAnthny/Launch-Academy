require_relative "../../lib/airplane"

describe Airplane do
  let(:my_plane) { Airplane.new("cesna", 10, 150) }

  let(:my_started_plane) { Airplane.new("cesna", 10, 150) }

  let(:my_flying_plane) { Airplane.new("cesna", 10, 150) }

  before(:each) do
    #@my_started_plane = Airplane.new("cesna", 10, 150)
    my_started_plane.start

    my_flying_plane.start
    my_flying_plane.takeoff
  end

  describe "#initialization" do
    it "should take type, wing loading, and horsepower as arguments" do
      expect(my_plane).to be_a(Airplane)
    end
  end

  describe "#start" do
    it "should turn on the airplane engine if it is not already running" do
      expect(my_plane.start).to eq("airplane started")
    end

    it "should state already started if the engine is running" do
      expect(my_started_plane.start).to eq("airplane already started")
    end
  end

  describe "#takeoff" do
    it "should launch the airplane if the engine is running" do
      expect(my_started_plane.takeoff).to eq("airplane launched")
    end

    it "should not be able to takeoff without the engine running" do
      expect(my_plane.takeoff).to eq("airplane not started, please start")
    end
  end

  describe "#land" do
    it "should change the state of the plane to landed" do
      expect(my_flying_plane.land).to eq("airplane landed")
    end

    it "should land only if it is currently flying" do
      expect(my_started_plane.land).to eq("airplane is already on the ground")
    end

    it "should return landing or unable to start state" do
      expect(my_plane.land).to eq("airplane not started, please start")
    end
  end

  describe "#fuel" do
    it "should be an internal attribute set at initialization" do
      expect(my_plane.fuel).to eq(100)
    end

    it "should be deducted for the #start method" do
      my_plane.start
      expect(my_plane.fuel).to eq(90)
    end

    it "should be deducted for the #takeoff method (after running #start)" do
      my_plane.start
      my_plane.takeoff
      expect(my_plane.fuel).to eq(70)
    end

    it "should be deducted for the #land method (after #start and #takeoff)" do
      my_plane.start
      my_plane.takeoff
      my_plane.land
      expect(my_plane.fuel).to eq(20)
    end

    it "should not allow methods to be run with inadequate fuel" do
      my_plane.instance_variable_set(:@fuel, 0)
      expect(my_plane.start).to eq("there's not enough fuel!")
    end
  end
end
