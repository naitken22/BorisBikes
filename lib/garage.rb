require './lib/BikeContainer'
require './lib/bike'

class Garage

include BikeContainer


	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def fix_bike(bikes)
		bikes.each {|bike| bike.fix!}
	end

	

end