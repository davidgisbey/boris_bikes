class DockingStation
  attr_reader :bikes
  attr_reader :location
  def initialize(location="default_location")
    @bikes = Array.new
    @location = location
  end
  def release_bike
     return Bike.new
  end
  def recieves_bike(bike)
    @bikes.push(bike)
  end
end
