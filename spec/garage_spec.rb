require './lib/garage'
require './spec/BikeContainer_spec.rb'

describe Garage do 

	let(:bikeshop) {Garage.new(capacity: 123)}

	it_behaves_like 'a bike container'


	it 'should allow setting of default capacity' do
		expect(bikeshop.capacity).to eq 123
	end

	it 'should be able to fix multiple broken bikes' do
		broken_bike1 = double :bike, broken?: true, instance_of?: 'Bike'
		bikeshop.dock(broken_bike1)
		expect(broken_bike1).to receive(:fix!)
		bikeshop.fix_all_broken_bikes
	end

	
end