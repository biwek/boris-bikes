class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
	end


	# take broken bikes
	def take_broken_bikes(station)
		station.broken_bikes.each {|bike| bikes << station.release(bike) }
	end

	# move fixed bikes from garage
	# def move_fixed_bikes(garage)
	# 	garage.bikes.each {|bike| bikes << garage.release(bike)}
	# end
	def move_fixed_bikes(garage, station)
		garage.available_bikes.each {|bike| station.bikes << garage.release(bike)}
	end


end