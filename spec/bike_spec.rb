require "bike.rb"

describe Bike do
  let(:bike) { Bike.new }
  it "check that bike works" do
    expect(bike.respond_to?("is_working")).to eq(true)
  end
end 
