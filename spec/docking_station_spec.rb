require 'docking_station'
require 'bike'

describe DockingStation do
  let(:docking_station) { DockingStation.new }
  describe "DockingStation response to release bike" do
   it { should respond_to?("release_bikes") }
  end
   it "releases bike and bike works" do
     ds = DockingStation.new
     bike = Bike.new
     ds.recieves_bike(bike)
     bike1 = ds.release_bike
     expect(bike1.is_working).to eq true
  end
  it "returns bike to a docking station" do
     expect(docking_station.respond_to?("recieves_bike")).to eq(true)
  end
  it "checks if a bike is available" do
     ds = DockingStation.new
     bike = Bike.new
     ds.recieves_bike(bike)
     expect(ds.available?).to eq true
  end
  it "doesn't release when docking station is empty" do
    ds = DockingStation.new
    expect{ds.release_bike}.to raise_exception
    ds_1 = DockingStation.new
    bike = Bike.new
    ds_1.recieves_bike(bike)
    bike_2 = ds_1.release_bike
    expect(bike_2.instance_of? Bike).to eq true
  end
  it "doesn't receive bike if docking station is full" do
    ds = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times {ds.recieves_bike(Bike.new)}
    bike = Bike.new
    expect{ds.recieves_bike(bike)}.to raise_exception
  end
  it "checks if capacity is 20" do
    ds = DockingStation.new()
    expect(ds.capacity). to eq DockingStation::DEFAULT_CAPACITY
    ds_1 = DockingStation.new(15)
    expect(ds_1.capacity).to eq 15
  end
  it "user can report bike when broken" do
    bike = Bike.new
    ds = DockingStation.new
    bike.has_been_broken
    ds.recieves_bike(bike)
    expect(ds.broken_bikes.size).to eq 1
  end
end
