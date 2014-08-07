require 'spec_helper'

describe Elevator do
  before(:each) do
    @elevator = Elevator.new(0, 10)
  end

  describe "#new" do
    it "sets the elevator number" do
      @elevator = Elevator.new(3, 10)
      expect(@elevator.number).to eq(3)
    end

    it "sets the number of floors" do
      @elevator = Elevator.new(2, 8)
      expect(@elevator.no_floors).to eq(8)
    end
  end
end
