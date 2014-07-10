require_relative 'BikeContainer'

class Dockingstation

	include BikeContainer

	def initialize(options = {})
		capacity = options.fetch(:capacity, capacity).instance_of?(Fixnum) ? options[:capacity] : 10
		self.capacity = capacity
		self.bikes = options.fetch(:bikes, bikes)
	end
	
	def is_empty?
		bikes.empty?
	end

	def list_broken
		list_broken = bikes.find_all {|bike| bike.broken? == true}
	end

	

end