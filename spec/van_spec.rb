require './lib/van'
require './lib/docking_station'
require './lib/bike' 
require './lib/garage'

describe Van do 
	
	let(:bikevan) {Van.new(:capacity => 123)}
	let(:specialized) {Bike.new.break!}
	let(:old_street) {Dockingstation.new}

	it 'should allow setting of default capacity' do
		expect(bikevan.capacity).to eq 123
	end



	it 'should collect broken bikes from the docking station' do
		bike1 = Bike.new.break!
		bike2 = Bike.new
		bike3 = Bike.new
		old_street.dock(bike1)
		old_street.dock(bike2)
		old_street.dock(bike3)
		bikevan.collect_broken_bikes(old_street)
		expect(bikevan.bikes).to eq [bike1]

	end

end