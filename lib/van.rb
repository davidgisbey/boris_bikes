class Van

  attr_reader :collected_bikes

  def initialize
    @collected_bikes = Array.new
  end

  def collect_broken(collecting_from)
    collecting_from.broken_bikes.each do |bike|
      @collected_bikes.push bike
    end
    collecting_from.broken_bikes = []
  end

  def deliver_bikes(delivering_to)
    @collected_bikes.each do |bike|
      bike.repair_bike
      delivering_to.fixed_bikes.push(bike)
    end
    @collected_bikes = []
  end
end
