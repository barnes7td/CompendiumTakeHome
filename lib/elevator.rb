require_relative "./elevator_door.rb"

class Elevator
  attr_reader :no_floors, :door, :number, :floor

  def initialize(number, no_floors)
    @number = number
    @no_floors = no_floors
    @floor = 1
    @door = ElevatorDoor.new
  end

  def status
    "Elevator ##{number} is on Floor ##{floor} and the door is #{door.status}"
  end

  def go_to_floor(floor)
    @floor = floor
    @door.open_door
  end

  def random_floor
    @floor = rand(@no_floors) + 1
  end

  def accessible?(passenger_floor)
    floor == passenger_floor
  end

  def open_door
    @door.open_door
  end

  def close_door
    @door.close_door
  end

  def door_open?
    @door.open?
  end
end
