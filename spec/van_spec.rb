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

	before :each do
		bikevan.collect_broken_bikes(old_street)
	end


	it 'should collect broken bikes from the docking station' do
		expect(bikevan.bikes.count).to eq 1
	end

	it 'should release the broken bikes at the garage and dock in the garage' do 
		bikevan.deposit_at(bikeshop)
		expect(bikevan.bikes.count).to eq 0
		expect(bikeshop.bikes.count).to eq 1
	end

	before :each do 
		bikevan.deposit_at(bikeshop)
		bikeshop.fix_bike(bikeshop.bikes)
		bikevan.pickup_fixed_bikes(bikeshop)
	end

	it 'should collect the fixed bikes from the garage' do
		expect(bikeshop.bikes.count).to eq 0
		expect(bikevan.bikes.count).to eq 1
	end

	it 'should deposit the fixed bikes at the station' do
		bikevan.deposit_at(old_street)
		expect(bikevan.bikes.count).to eq 0
		expect(old_street.bikes.count).to eq 3
	end

end