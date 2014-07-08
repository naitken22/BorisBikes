require 'docking_station'
require 'bike'

describe Dockingstation do

  let(:station) { Dockingstation.new(:capacity => 123) }

  it "should allow setting default capacity on initialising" do
    expect(station.capacity).to eq(123)
  end
end


