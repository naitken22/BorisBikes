require 'BikeContainer'
require 'bike'


class ContainerHolder

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

 end

shared_examples 'a bike container' do
	let(:container) {described_class.new(capacity => 10)}
	let(:batavus) {Bike.new}
	let(:holder) {ContainerHolder.new}

	def fill_station(station)
		(BikeContainer::DEFAULT_CAPACITY).times {holder.dock(batavus)}
	end

	it 'has no bikes when created' do 
		expect(holder.bikes.count).to eq 0
	end

	it 'can dock a bike' do
		batavus	
		holder
		holder.dock(batavus)
		expect(holder.bikes.count).to eq 1
	end

	it 'should release a bike' do
		holder.dock(batavus)
		holder.release(batavus)
		expect(holder.bikes.count).to eq 0
	end

	it 'should know when it is full' do
		(BikeContainer::DEFAULT_CAPACITY).times {holder.dock(Bike.new)}
		expect(holder.is_full?).to be true
	end

	it 'should not accept a bike when full' do
		fill_station(holder)
		expect{holder.dock(batavus)}.to raise_error(RuntimeError)
	end

	it 'should give a list of all available bikes' do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

	context 'release' do

		it 'gives an error when passed an empty argument' do
			expect{holder.release}.to raise_error(ArgumentError)
		end
			# end

		it 'raises an error if the argument is not a bike that the station holds' do
			expect{holder.release(Garage.new)}.to raise_error(RuntimeError)
		end
	end

	context 'dock' do

		it 'gives an arror when passed an empty argument' do
			expect{holder.dock}.to raise_error(ArgumentError)
		end

		it 'gives an error if something is tried to dock that is not a bike' do
			expect{holder.dock(Garage.new)}.to raise_error(RuntimeError)
		end

	end

end