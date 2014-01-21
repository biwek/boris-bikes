class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
	end


	# take broken bikes
	def take_broken_bikes
	end

	# # take fixed bike to station
	# def take_fixed_bikes

	# end

end