require './lib/BikeContainer'
# require './lib/bike'

class Van

include BikeContainer

	def initialize(options = {})
		capacity = options.fetch(:capacity, capacity).instance_of?(Fixnum) ? options[:capacity] : 10
		self.capacity = capacity
	end

	def collect_broken_bikes(station)
		station.list_broken.each{ |bike| dock(station.release(bike)) }
	end

	def deposit_broken_bikes_at(garage)
		broken_bikes.each{|bike| garage.dock(release(bike))}
	end

	def pickup_fixed_bikes(garage)
		garage.available_bikes.each do |bike| 
			garage.release(bike)
			dock(bike)
		end
	end

	def deposit_fixed_bikes_at(dockingstation)
		available_bikes.each{|bike| dockingstation.dock(release(bike))}
	end


	def collect_broken_bikes_from(station)
		station.bikes.each{ |bike| dock(bike) if bike.broken?}
	end

end