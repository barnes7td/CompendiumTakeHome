require_relative './lib/command_line.rb'

class Elevation
  attr_reader :tower

  def initialize
    @command_line = CommandLine.new
    @command_line.get_initial_input
  end

  def run
    loop do
      puts "Choose a command:"
      choice = gets.chomp.downcase.split
      puts

      output = @command_line.output(choice)
      puts output

      break if output == "Elevator over!"
    end
  end

end

e = Elevation.new
e.run
