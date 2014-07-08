require_relative 'BikeContainer'

class Dockingstation

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end


	
def is_empty?
	bikes.empty?
end



end