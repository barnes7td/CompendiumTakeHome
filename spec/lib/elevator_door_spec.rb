require 'spec_helper'

describe ElevatorDoor do
  before(:each) do
    @door = ElevatorDoor.new
  end

  describe "#new" do
    it "sets the door to be closed" do
      expect(@door.open?).to be(false)
    end
  end

  describe "#status" do
    it "returns 'open' when door is open" do
      @door.open_door
      expect(@door.status).to include("open")
    end

    it "returns 'closed' when door is close" do
      expect(@door.status).to include("closed")
    end
  end

  describe "#open_door" do
    it "opens the door"do
      @door.open_door
      expect(@door.open?).to be(true)
    end
  end

  describe "#close_door" do
    it "closes the door"do
      @door.open_door
      @door.close_door
      expect(@door.open?).to eq(false)
    end
  end
end
