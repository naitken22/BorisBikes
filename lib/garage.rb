require './lib/BikeContainer'
require './lib/bike'

class Garage

include BikeContainer


	def initialize(options = {})
		capacity = options.fetch(:capacity, capacity).instance_of?(Fixnum) ? options[:capacity] : 10
		self.capacity = capacity
	end

	def fix_bike(bikes)
		bikes.each {|bike| bike.fix!}
	end

	

end