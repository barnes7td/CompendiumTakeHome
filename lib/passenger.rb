class Passenger
  def initialize
    @floor = 1
    @elevator = nil
    @in_elevator = false
  end

  def status
    result = "You are on floor ##{floor}"
    if in_elevator?
      result << " inside Elevator ##{@elevator.number}"
    end
    result
  end

  def floor
    @floor = @elevator.floor if in_elevator?
    @floor
  end

  def enter_elevator(elevator)
    @elevator = elevator
    @in_elevator = true
  end

  def exit_elevator
    @elevator = nil
    @in_elevator = false
  end

  def in_elevator?
    @in_elevator
  end

  def close_elevator_door
    @elevator.close_door
  end

  def send_elevator_to(floors)
    @destinations = floors
    @destinations.each do |floor|
      @elevator.go_to_floor(floor.to_i)
      puts "You road Elevator ##{@elevator.number} to floor ##{floor}"
    end
  end
end
