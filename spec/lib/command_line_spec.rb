require 'spec_helper'

describe CommandLine do

  before(:each) do
    @command_line = CommandLine.new
  end

  describe "#get_initial_input" do
    it "should grab and set user options" do
      ARGV.replace %w[-e 3 -f 10]
      @command_line.get_initial_input

      expect(@command_line.tower.no_elevators).to eq(3)
      expect(@command_line.tower.no_floors).to eq(10)
    end
  end

  describe "#output" do
    it "seeds (randomizes) elevators" do

    end

    it "calls an elevator to a floor" do

    end

    it "enters the passenger on to an elevator" do

    end

    it "exits the passenger from an elevator" do

    end

    it "closes an elevators door"
  end

end
