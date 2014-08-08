require 'pry'

require_relative './elevator.rb'
require_relative './passenger.rb'
require_relative './locator.rb'

class Tower
  attr_reader :passenger, :locator
  attr_reader :no_floors, :no_elevators, :floors, :elevators

  def initialize
    @passenger = Passenger.new
    @locator = Locator.new
    @status = []
    @message = []
  end

  def setup(no_elevators, no_floors)
    @no_elevators = no_elevators.to_i
    @no_floors = no_floors.to_i
    @elevators = Array.new(@no_elevators) { |n| Elevator.new(n, @no_floors) }
    @floors = (1..@no_floors).to_a
  end

  def message
    result = @message
    @message = []
    result
  end

  def status
    result = @status
    # binding.pry
    @elevators.each {|elevator| result << "#{elevator.status}"}
    result << @passenger.status
    result
  end

  def clear_messages
    @message = []
    @status = []
  end

  def seed
    elevators.each do |elevator|
      elevator.random_floor
    end
    @message << "Elevators have been sent to random floors."
  end

  def call(floor, direction)
    closest_elevator.go_to_floor(floor.to_i)
    @message << "Elevator ##{closest_elevator.number} has moved down to Floor ##{floor}"
  end

  def enter(elevator_no = elevator_on_same_floor)
    elevator = elevators[elevator_no.to_i]
    if elevator.accessible?(@passenger.floor)
      @passenger.enter_elevator(elevator)
      @message << "You went inside Elevator ##{elevator.number}"
    else
      @message << "Elevator ##{elevator.number} is not accessible"
    end
  end

  def exit
    if @passenger.in_elevator?
      elevator = @passenger.elevator
      @passenger.exit_elevator
      @message << "You left Elevator ##{elevator.number}"
    else
      @message << "You are not in an elevator!"
    end
  end

  def close
    if @passenger.in_elevator?
      elevator = @passenger.elevator
      @passenger.close_elevator_door
      @message << "You closed the door of Elevator ##{elevator.number}"
    else
      @message << "You are not in an elevator!"
    end
  end

  def go(floors)
    if @passenger.in_elevator?
      @message << @passenger.send_elevator_to(floors)
    else
      @message << "You are not in an elevator!"
    end
  end

  def where
    @message << @passenger.status
  end

  private

  def elevator_on_same_floor
    @elevators.select { |e| e.floor == @passenger.floor }.first
  end

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
