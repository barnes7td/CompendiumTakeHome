class ElevatorDoor
  def intitialize
    @open = false
  end

  def status
    @open ? "open" : "closed"
  end

  def open_door
    @open = true
  end

  def close_door
    @open = false
  end

  def open?
    @open
  end
end
