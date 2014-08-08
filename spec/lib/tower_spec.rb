require 'spec_helper'

describe Tower do

  before(:each) do
    @tower = Tower.new
    @tower.setup(3, 10)
  end

  describe "#new" do
    it "initializes passenger and locator" do
      expect(@tower.passenger).to be_a Passenger
      expect(@tower.locator).to be_a Locator
    end
  end

  describe "#setup" do
    it "initializes elevators and floors" do
      @tower.setup(2, 8)
      expect(@tower.floors.length).to eq(8)
      expect(@tower.elevators.length).to eq(2)
    end
  end

  describe "#status" do
    it "returns status for elevators" do
      expect(@tower.status.join(" ")).to include("Elevator")
    end

    it "returns status for Passenger" do
      expect(@tower.status.join(" ")).to include("You")
    end
  end

  # describe "seed" do
  #   it "sends #random_floor to elevators" do
  #     elevator = @tower.elevators.first
  #     expect(elevator).to receive(:random_floor)
  #   end
  # end

  # describe "#call" do
  #
  # end

end
