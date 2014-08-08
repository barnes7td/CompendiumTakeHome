require 'spec_helper'

feature 'Initializing Elevators' do
  scenario 'App sets the right amount of elevators' do
    ARGV.replace %w[-e 3 -f 10]
    command_line = CommandLine.new
    command_line.get_initial_input
    expect(command_line.tower.no_elevators).to eq(3)
  end

  scenario 'App sets the right amount of floors' do
    ARGV.replace %w[-e 3 -f 10]
    command_line = CommandLine.new
    command_line.get_initial_input
    expect(command_line.tower.no_floors).to eq(10)
  end
end
