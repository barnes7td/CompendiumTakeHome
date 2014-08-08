require 'spec_helper'

feature 'Calling Elevators' do

  before do
    ARGV.replace %w[-e 3 -f 10]
    @command_line = CommandLine.new
    @command_line.get_initial_input
  end

  scenario 'User can call elevator to a specific floor' do
    @command_line.output("seed")
    @command_line.output(%w[call 3])
    expect(@command_line.tower.elevators.map {|e| e.floor }).to include(3)
  end
end
