require_relative 'BikeContainer'

class Dockingstation

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
		self.bikes = options.fetch(:bikes, bikes)
	end


	
	def is_empty?
		bikes.empty?
	end


	def list_broken
		list_broken = bikes.find_all {|bike| bike.broken? == true}
	end

end