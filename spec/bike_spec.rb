require "bike.rb"

describe Bike do
  it "check that bike works" do
    expect(subject.respond_to?("is_working")).to eq(true)
  end
end
