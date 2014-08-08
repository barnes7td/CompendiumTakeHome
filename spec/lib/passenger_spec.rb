require 'spec_helper'

describe Passenger do
  before(:each) do
    @passenger = Passenger.new
  end

  describe "#status" do
    it "returns a String" do
      expect(@passenger.status).to be_a(String)
    end

    it "returns was floor the passenger is on" do
      status = "You are on floor #1"
      expect(@passenger.status).to eq(status)
    end
  end

  describe "#floor" do
    context "when passenger is inside an elevator" do
      it "sets the passenger's floor to the elevator's floor" do
        elevator = Elevator.new(0, 10)
        elevator.go_to_floor(4)

        @passenger.enter_elevator(elevator)
        expect(@passenger.floor).to eq(4)
      end
    end

    context "when passenger is not inside and elevator" do
      it "returns the floor of passenger is not in an elevator" do
        expect(@passenger.floor).to eq(1)
      end
    end
  end

  describe "#enter_elevator" do
    it "puts passenger inside of an elevator" do
      elevator = Elevator.new(0, 10)
      elevator.go_to_floor(4)

      @passenger.enter_elevator(elevator)
      expect(@passenger.in_elevator?).to eq(true)
    end
  end

  describe "#exit_elevator" do
    it "brings passenger outside of an elevator" do
      elevator = Elevator.new(0, 10)
      elevator.go_to_floor(4)

      @passenger.enter_elevator(elevator)
      elevator.go_to_floor(6)
      @passenger.exit_elevator
      expect(@passenger.in_elevator?).to eq(false)
    end
  end

  describe "#in_elevator?" do
    context "when passenger is inside an elevator" do
      it "returns true" do
        elevator = Elevator.new(0, 10)
        elevator.go_to_floor(4)

        @passenger.enter_elevator(elevator)
        expect(@passenger.in_elevator?).to eq(true)
      end
    end

    context "when passenger is not inside an elevator" do
      it "returns false" do
        elevator = Elevator.new(0, 10)
        elevator.go_to_floor(4)

        @passenger.enter_elevator(elevator)
        @passenger.exit_elevator
        expect(@passenger.in_elevator?).to eq(false)
      end
    end
  end

  describe "#close_elevator_door" do
    context "when passenger is inside an elevator" do
      it "closes the elevator's door"do
        elevator = Elevator.new(0, 10)
        elevator.go_to_floor(4)

        @passenger.enter_elevator(elevator)
        expect(elevator.door_open?).to eq(true)

        @passenger.close_elevator_door

        expect(elevator.door_open?).to eq(false)
      end
    end
  end

  describe "#send_elevator_to" do
    context "when passenger is inside an elevator" do
      it "changes the elevator's floor"do
        elevator = Elevator.new(0, 10)
        elevator.go_to_floor(4)

        @passenger.enter_elevator(elevator)
        @passenger.send_elevator_to([6])

        expect(elevator.floor).to eq(6)
      end

      it "changes the passenger's floor"do
        elevator = Elevator.new(0, 10)
        elevator.go_to_floor(4)

        @passenger.enter_elevator(elevator)
        @passenger.send_elevator_to([6])

        expect(@passenger.floor).to eq(6)
      end
    end
  end
end
