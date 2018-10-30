class Bike
  def is_working
    return true
  end
  def return_bike(station)
    station.recieves_bike(self)
  end
end
