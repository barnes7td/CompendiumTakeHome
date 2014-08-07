require 'spec_helper'

describe 'Initializing elevators and floors' do
  it 'sets the elevators' do
    ARGV.replace %w[-e 3 -f 10]
    command_line = CommandLine.new
    command_line.get_user_input
    expect(command_line.tower.no_elevators).to eq(3)
  end

  it 'sets the floors' do
    ARGV.replace %w[-e 3 -f 10]
    command_line = CommandLine.new
    command_line.get_user_input
    expect(command_line.tower.no_floors).to eq(10)
  end
end
