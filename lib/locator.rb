class Locator
  def closest_elevator(passenger_floor, floors_of_elevators)
    distances = floors_of_elevators.map { |floor| (floor.to_i - passenger_floor).abs }
    closest_distance = distances.min
    distances.index(closest_distance)
  end
end
