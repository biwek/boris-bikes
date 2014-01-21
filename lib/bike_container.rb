module BikeContainer

	DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||= [] 
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count
	end

	def dock(bike)
		raise "Station is full!" if full?
		bikes << bike
	end

	def release(bike)
		raise "Currently there are no bikes in the station" if empty?
		bikes.delete(bike)
	end

	def full?
		bike_count == capacity
	end

	def empty?
		bikes.empty?
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def broken_bikes
		bikes.select {|bike| bike.broken?}
	end

	def release_broken_bikes(broken_bikes)
		broken_bikes.each {|bike| release(bike)}
	end

	# def take_broken_bikes(broken_bike)
	# 	broken_bikes.each {|bikes| bikes << release(broken_bike) }
	# end


	def accept(bike)
		bike.fix
		dock(bike)
	end
end

