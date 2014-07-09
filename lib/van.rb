require './lib/BikeContainer'
require './lib/bike'

class Van

include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def collect_broken_bikes(station)
		station.list_broken.each{ |bike| dock(station.release(bike)) }
	end

	def deposit_at(garage)
		bikes.each{|bike| garage.dock(release(bike))}
	end

	def pickup_fixed_bikes(garage)
		garage.bikes.each{|bike| dock(garage.release(bike))}
	end

end