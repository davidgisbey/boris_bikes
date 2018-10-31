require_relative './bike.rb'

class DockingStation
  attr_reader :bikes
  attr_reader :location

  def initialize(location="default_location")
    @bikes = []
    @location = location
  end

  def release_bike
    if available?
      @bikes.delete_at(0)
    else
      raise Exception.new("No bikes are available.")
    end
  end

  def recieves_bike(bike)
    if @bikes.length >= 20
      false
    else
      @bikes.push(bike)
    end
  end

  def available?
    if @bikes.length > 0
      true
    else
      false
    end
  end
end
