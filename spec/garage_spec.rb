require 'garage'
require 'bike'

describe Garage do 

	let(:broken_bike) {Bike.new.break!}
	let(:bikeshop) {Garage.new(capacity: 123)}

	it 'should allow setting of default capacity' do
		expect(bikeshop.capacity).to eq 123
	end

	it 'should be able to fix a broken bike' do
		bikeshop.fix_bike(broken_bike)
		expect(broken_bike.broken?).to be false
	end

	it 'can dock bikes' do
		bikeshop.dock(broken_bike)
		expect(bikeshop.bikes.count).to eq 1
	end

	
end