class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
	end


	# take broken bikes
	def take_broken_bikes(broken_bikes)
	end


end