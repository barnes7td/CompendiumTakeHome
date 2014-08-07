require 'pry'

require_relative './elevator.rb'
require_relative './passenger.rb'
require_relative './locator.rb'

class Tower
  attr_reader :no_floors, :no_elevators

  def initialize
    @passenger = Passenger.new
    @locator = Locator.new
  end

  def setup(no_elevators, no_floors)
    @no_elevators = no_elevators.to_i
    @no_floors = no_floors.to_i
    @elevators = Array.new(@no_elevators) { |n| Elevator.new(n, @no_floors) }
    @floors = (1..@no_floors).to_a
  end

  def status
    @elevators.each {|elevator| puts elevator.status}
    @passenger.status
  end

  def seed
    elevators.each do |elevator|
      elevator.random_floor
    end
  end

  def call(floor, direction)
    closest_elevator.go_to_floor(floor.to_i)
    puts "#{@passenger.floor}:#{direction}"
    puts "Elevator ##{closest_elevator.number} has arrived!"
  end

  def enter(elevator_no)
    elevator = elevators[elevator_no.to_i]
    if elevator.accessible?(@passenger.floor)
      @passenger.enter_elevator(elevator)
    else
      puts "Elevator ##{elevator.number} is not accessible"
    end
  end

  def exit
    if @passenger.in_elevator?
      @passenger.exit_elevator
    else
      puts "You are not in an elevator!"
    end
  end

  def close
    if @passenger.in_elevator?
      @passenger.close_elevator_door
    else
      puts "You are not in an elevator!"
    end
  end

  def go(floors)
    if @passenger.in_elevator?
      @passenger.send_elevator_to(floors)
    else
      puts "You are not in an elevator!"
    end
  end

  private

  def closest_elevator
    index = @locator.closest_elevator(@passenger.floor, elevator_floors)
    elevators[index]
  end

  def elevator_floors
    @elevators.map { |e| e.floor }
  end

  def elevator_accessible?(elevator)
    elevator.floor == @passenger.floor
  end
end
