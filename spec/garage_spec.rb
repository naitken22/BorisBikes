require 'garage'
require 'bike'

describe Garage do 

	let(:broken_bike) {Bike.new.break!}
	let(:broken_bike2) {Bike.new.break!}
	let(:bikeshop) {Garage.new(capacity: 123)}

	it_behaves_like 'a bike container'


	it 'should allow setting of default capacity' do
		expect(bikeshop.capacity).to eq 123
	end

	it 'should be able to fix multiple broken bikes' do
		bikes = [broken_bike, broken_bike2]
		bikeshop.fix_bike(bikes)
		expect(broken_bike.broken?).to be false
	end

	
end