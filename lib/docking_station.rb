require_relative './bike.rb'

class DockingStation
  attr_reader :bikes
  attr_reader :capacity
  attr_reader :broken_bikes
  
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def release_bike
    if available?
      @bikes.delete_at(0)
    else
      raise Exception.new("No bikes are available.")
    end
  end

  def recieves_bike(bike)
    if full?
      raise Exception.new("At full capacity.")
    else
      if bike.is_working
        @bikes.push(bike)
      else
        @broken_bikes.push(bike)
      end
    end
  end

  def available?
    if @bikes.length > 0
      true
    elsif
      false
    end
  end

  private
  def full?
    @bikes.length + @broken_bikes.length == @capacity ? true : false
  end
end
