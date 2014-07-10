module BikeContainer

	DEFAULT_CAPACITY = 10


	def bikes
		@bikes ||=[]
	end

	def bikes=(value)
		@bikes = value
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def dock(bike)
		raise "this is not a bike" if !bike.instance_of?(Bike)
		raise "Station is full" if is_full?
		bikes << bike
	end

	def release(bike)
		raise "bike does not exist" if (!bikes.include?(bike))
		bikes.reject! {|bikes| bikes == bike}
		bike
	end

	def is_full?
		bikes.count == @capacity
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def broken_bikes
		bikes - available_bikes
	end

	

end