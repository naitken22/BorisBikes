require_relative 'BikeContainer'

class Dockingstation

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	




end