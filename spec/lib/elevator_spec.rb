require 'spec_helper'

describe Elevator do
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

  describe "#status" do
    it "shows the elevator number" do
      @elevator = Elevator.new(2, 8)
      expect(@elevator.status).to include("2")
    end

    it "shows the floor number" do
      @elevator = Elevator.new(2, 8)
      @elevator.go_to_floor(6)
      expect(@elevator.status).to include("6")
    end

    it "shows the status of the door" do
      @elevator = Elevator.new(2, 8)
      expect(@elevator.status).to include("closed")
    end
  end

  describe "#go_to_floor" do
    it "sends the elevator to a floor" do
      @elevator = Elevator.new(0, 8)
      @elevator.go_to_floor(6)

      expect(@elevator.floor).to eq(6)
    end
  end

  describe "#random_floor" do
    it "send the elevator to a floor that exists" do
      @elevator = Elevator.new(0, 8)
      expect(1..@elevator.no_floors).to include(@elevator.random_floor)
    end
  end

  describe "#accessible?" do
    context "when elevator is on the same floor given floor" do
      it "returns true" do
        @elevator = Elevator.new(0, 8)

        expect(@elevator.accessible?(1)).to eq(true)
      end
    end

    context "when elevator is not on the same floor given floor" do
      it "returns false" do
        @elevator = Elevator.new(0, 8)
        @elevator.go_to_floor(2)

        expect(@elevator.accessible?(1)).to eq(false)
      end
    end
  end

  describe "#open_door" do
    it "opens the door" do
      @elevator = Elevator.new(0, 8)
      @elevator.open_door

      expect(@elevator.door_open?).to eq(true)
    end
  end

  describe "#close_door" do
    it "opens the door" do
      @elevator = Elevator.new(0, 8)
      @elevator.close_door

      expect(@elevator.door_open?).to eq(false)
    end
  end
end
