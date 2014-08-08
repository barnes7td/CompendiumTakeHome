require_relative './lib/command_line.rb'

class Elevation
  attr_reader :tower

  def initialize
    @command_line = CommandLine.new
    @command_line.get_initial_input
  end

  def run
    loop do
      print "elevation >:  "
      choice = gets.chomp.downcase.split
      puts

      output = @command_line.output(choice)

      if output == "Elevator over!"
        puts output
        break
      else
        puts output
      end

    end
  end

end

e = Elevation.new
e.run
