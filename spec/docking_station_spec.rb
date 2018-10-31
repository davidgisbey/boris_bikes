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
    expect(ds.release_bike).to eq false
    ds_1 = DockingStation.new
    bike = Bike.new
    ds_1.recieves_bike(bike)
    bike_2 = ds_1.release_bike
    expect(bike_2.instance_of? Bike).to eq true
  end
end