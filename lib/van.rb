class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
	end

	# move broken bikes

	# take fixed bike to station

end