require 'van'

describe Van do
  it "Check van instance can be created" do
  van = Van.new
  expect(van).to be_a(Van)
end

  it "Check van responds to van.collect_broken" do
    van = Van.new
    expect(van).to respond_to(:collect_broken)
  end

  it "Check van can use van.collect_broken to collect the broken bikes" do
    van = Van.new
    ds = DockingStation.new
    fixed_bike = Bike.new
    broken_bike = Bike.new
    broken_bike.has_been_broken
    ds.receives_bike(fixed_bike)
    ds.receives_bike(broken_bike)
    van.collect_broken(ds)
    expect(van.collected_bikes.size).to eq 1
  end

  it "Check van only collects broken bikes" do
    van = Van.new
    ds = DockingStation.new
    fixed_bike = Bike.new
    broken_bike = Bike.new
    broken_bike.has_been_broken
    ds.receives_bike(fixed_bike)
    ds.receives_bike(broken_bike)
    van.collect_broken(ds)
    expect(van.collected_bikes.first.is_working).to eq false
  end

  it "Check that bikes are not in the docking station after collection" do
    van = Van.new
    ds = DockingStation.new
    fixed_bike = Bike.new
    broken_bike = Bike.new
    broken_bike.has_been_broken
    ds.receives_bike(fixed_bike)
    ds.receives_bike(broken_bike)
    van.collect_broken(ds)
    expect(ds.broken_bikes.size).to eq 0
  end

  it "Check that van can deliver bikes to garage" do
  van = Van.new
  ds = DockingStation.new
  broken_bike = Bike.new
  garage = Garage.new
  broken_bike.has_been_broken
  ds.receives_bike(broken_bike)
  van.collect_broken(ds)
  van.deliver_bikes(garage)
  expect(garage.fixed_bikes.size).to eq 1
end

  it "checks the bikes are fixed at the garage" do
    van = Van.new
    ds = DockingStation.new
    broken_bike = Bike.new
    garage = Garage.new
    broken_bike.has_been_broken
    ds.receives_bike(broken_bike)
    van.collect_broken(ds)
    van.deliver_bikes(garage)
    expect(garage.fixed_bikes.first.is_working).to eq true
  end

  it "checks that bikes are not in the van after delivering to the garage" do
    van = Van.new
    ds = DockingStation.new
    broken_bike = Bike.new
    garage = Garage.new
    broken_bike.has_been_broken
    ds.receives_bike(broken_bike)
    van.collect_broken(ds)
    van.deliver_bikes(garage)
    expect(van.collected_bikes.size).to eq 0
  end

end
