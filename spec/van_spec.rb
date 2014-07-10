require './lib/van'
require './spec/BikeContainer_spec'
# require './lib/garage'

describe Van do 

	
	it_behaves_like 'a bike container' 
	let(:bikevan) {Van.new(:capacity => 123)}
	let(:broken_bike) {double :bike, broken?: true, instance_of?: 'Bike'}
	let(:working_bike) {double :bike, broken?: false, instance_of?: 'Bike'}
	let(:garage) {double :garage, available_bikes: [working_bike], release: :bike, dock: nil}
	let(:station) {double :docking_station, bikes: [broken_bike, working_bike], dock: nil}

 	it 'should allow setting of default capacity' do
		expect(bikevan.capacity).to eq 123
	end

	it 'should collect broken bikes from the docking station' do
		bikevan.collect_broken_bikes_from(station)
		expect(bikevan.bikes).to eq [broken_bike]
	end

	it 'should release the broken bikes at the van and dock in the garage' do 
				bikevan.bikes = [broken_bike]
				bikevan.deposit_broken_bikes_at(garage)
				expect(bikevan.broken_bikes).to eq []		
	end

	it 'should collect the fixed bikes from the garage' do
			bikevan.bikes = []
			bikevan.pickup_fixed_bikes(garage)
			expect(bikevan.bikes).to eq [working_bike]
	end

	it 'should deposit the fixed bikes at the station' do
		bikevan.bikes = [working_bike]
		bikevan.deposit_fixed_bikes_at(station)
		expect(bikevan.bikes).to eq []

	end

end