require './lib/van'
require './lib/docking_station'
require './lib/bike' 
require './lib/garage'

describe Van do 

	
	it_behaves_like 'a bike container'

	let(:old_street) { Dockingstation.new(:capacity => 123, :bikes => [bike1=Bike.new.break!, bike2=Bike.new, bike3=Bike.new])}
	let(:specialized) {Bike.new.break!}
	let(:bikevan) {Van.new(:capacity => 123)}
	let(:bikeshop) {Garage.new(capacity: 123)}

	it 'should allow setting of default capacity' do
		expect(bikevan.capacity).to eq 123
	end



	it 'should collect broken bikes from the docking station' do
		bikevan.collect_broken_bikes(old_street)
		expect(bikevan.bikes.count).to eq 1
	end

	it 'should release the broken bikes at the garage and dock in the garage' do 
		bikevan.collect_broken_bikes(old_street)
		bikevan.deposit_at(bikeshop)
		expect(bikevan.bikes.count).to eq 0
		expect(bikeshop.bikes.count).to eq 1
	end

	it 'should collect the fixed bikes from the garage' do
		bikevan.collect_broken_bikes(old_street)
		bikevan.deposit_at(bikeshop)
		bikeshop.fix_bike(bikeshop.bikes)
		bikevan.pickup_fixed_bikes(bikeshop)
		expect(bikeshop.bikes.count).to eq 0
		expect(bikevan.bikes.count).to eq 1

	end

end