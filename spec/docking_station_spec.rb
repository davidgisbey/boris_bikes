require 'docking_station'
require 'bike'

describe DockingStation do
  let(:docking_station) { DockingStation.new }
  describe "DockingStation response to release bike" do
   it { should respond_to?("release_bikes") }
  end
   it "releases bike and bike works" do
     bike = docking_station.release_bike
     expect(bike.is_working).to eq(true)
  end
  it "returns bike to a docking station" do
     expect(docking_station.respond_to?("recieves_bike")).to eq(true)
  end
end
