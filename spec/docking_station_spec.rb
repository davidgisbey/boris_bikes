require 'docking_station'
require 'bike'

describe DockingStation do
  let(:docking_station) { DockingStation.new }
  let(:bike) { bike = double("bike",
    :is_working => true,
    :has_been_broken => nil )
  }

  describe "DockingStation response to release bike" do
   it { should respond_to?("release_bikes") }
  end
   it "releases bike and bike works" do
     ds = DockingStation.new
     ds.receives_bike(bike)
     bike1 = ds.release_bike
     expect(bike1.is_working).to eq true
  end
  it "returns bike to a docking station" do
     expect(docking_station.respond_to?("receives_bike")).to eq(true)
  end
  it "checks if a bike is available" do
     ds = DockingStation.new
     ds.receives_bike(bike)
     expect(ds.available?).to eq true
  end
  it "doesn't release when docking station is empty" do
    ds = DockingStation.new
    expect{ds.release_bike}.to raise_exception
  end
  it "doesn't receive bike if docking station is full" do
    ds = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times {ds.receives_bike(Bike.new)}
    expect{ds.receives_bike(bike)}.to raise_exception
  end
  it "checks if capacity is 20" do
    ds = DockingStation.new()
    expect(ds.capacity). to eq DockingStation::DEFAULT_CAPACITY
    ds_1 = DockingStation.new(15)
    expect(ds_1.capacity).to eq 15
  end
  it "user can report bike when broken" do
    allow(bike).to receive(:is_working).and_return(false)
    ds = DockingStation.new
    bike.has_been_broken
    ds.receives_bike(bike)
    expect(ds.broken_bikes.size).to eq 1
  end
  it "checks broken bikes don't release from docking station" do
    allow(bike).to receive(:is_working).and_return(false)
    ds = DockingStation.new
    bike.has_been_broken
    ds.receives_bike(bike)
    expect{ds.release_bike}.to raise_exception(Exception, "No working bikes are available.")
  end
  it "checks both broken and working bikes are accepted by docking station and capacity is two" do
    bike2 = double("bike")
    allow(bike2).to receive(:is_working).and_return(false)
    allow(bike2).to receive(:has_been_broken)
    ds = DockingStation.new
    bike2.has_been_broken
    ds.receives_bike(bike)
    ds.receives_bike(bike2)
    expect(ds.bikes.size + ds.broken_bikes.size).to eq 2
  end
end
