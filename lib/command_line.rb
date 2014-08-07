require_relative "./tower.rb"

class CommandLine
  def initialize
    @tower = Tower.new
  end

  def get_initial_input
    _, @no_elevators, _, @no_floors = ARGV
    ARGV.clear
    @tower.setup(@no_elevators, @no_floors)
  end

  def output(choice)
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
      #NOOP
    when "quit"
      return "Elevator over!"
    end

    @tower.status
  end
end
