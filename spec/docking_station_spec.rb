require 'docking_station'
require 'bike'

describe Dockingstation do

	# it_behaves_like 'a bike container'

  let(:station) { Dockingstation.new(:capacity => 123, :bikes => [bike1=Bike.new.break!, bike2=Bike.new, bike3=Bike.new])}

	  it "should allow setting default capacity on initialising" do
	    expect(station.capacity).to eq(123)
	  end

  	it "can check if docking_station is empty" do
	  station = Dockingstation.new
	  bike = double :bike, broken?: false, instance_of?: Bike
	  station.dock(bike)
	  expect(station.is_empty?).to be false
	end

	it 'can be initialized with any number of bikes' do
		bike = double :bike, broken?: false, instance_of?: Bike
		bike2 = double :bike, broken?: false, instance_of?: Bike
		bikes = [bike, bike2]
		station = Dockingstation.new(bikes: bikes)
		expect(station.bikes).to eq bikes
	end

	it 'can give an array of broken bikes' do 
		expect(station.list_broken.count).to eq 1
	end

	it 'will not take a capacity that is not a positive number' do
		station = Dockingstation.new(:capacity => "hahaha")
		expect(station.capacity).to eq 10
	end


end


