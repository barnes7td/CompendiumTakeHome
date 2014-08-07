require 'spec_helper'

describe CommandLine do

  before(:each) do
    @command_line = CommandLine.new
    ARGV.replace %w[-e 3 -f 10]
    @command_line.get_user_input
  end

  describe "#closest_elevator" do
    it "should return and elevator" do
      @command_line.output("seed")
      p @command_line
      @command_line.output("seed")
      p @command_line
    end
  end

end
