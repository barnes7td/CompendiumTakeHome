require_relative "./tower.rb"

class CommandLine
  attr_reader :tower

  def initialize
    @tower = Tower.new
  end

  def get_initial_input
    _, @no_elevators, _, @no_floors = ARGV
    ARGV.clear
    @tower.setup(@no_elevators, @no_floors)
  end

  def output(choice)
    # binding.pry
    case choice[0]
    when "seed"
      @tower.seed
    when "call"
      floor, direction = choice[1..2]
      @tower.call(floor, direction)
    when "enter"
      index = choice[1]
      @tower.enter(index)
    when "exit"
      @tower.exit
    when "close"
      @tower.close
    when "go"
      floors = choice[1..-1]
      @tower.go(floors)
    when "where"
      @tower.where
    when "quit"
      return "Elevator over!"
    end

    result = []

    result << '------------------------'
    result << @tower.message
    result << '------------------------'
    result << @tower.status
    result << @tower.clear_messages

    result.join("\n")
  end
end
