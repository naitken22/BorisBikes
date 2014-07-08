require 'docking_station'
require 'bike'

describe Dockingstation do

  let(:station) { Dockingstation.new(:capacity => 123) }

  it "should allow setting default capacity on initialising" do
    expect(station.capacity).to eq(123)
  end

  it "should be empty when created" do
  	 expect(station.is_empty?).to be true
  end

  it "can check if docking_station is empty" do
  old_street = Dockingstation.new
  specialized = Bike.new
  old_street.dock(specialized)
  expect(old_street.is_empty?).to be false
end
end


