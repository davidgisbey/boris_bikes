require 'garage'

describe Garage do
  it "Can an instance of garage be created" do
  garage = Garage.new
  expect(garage).to be_a(Garage)
  end

end 
