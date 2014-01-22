class Garage

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
	end

	# def accept(bike)
	# 	bike.fix
	# end

	def collect_broken_bikes(van)
		van.broken_bikes.each {|bike| bikes << van.release(bike)}
	end

	def fix_broken_bikes(bike)
		bike.fix
		# garage.broken_bikes.each {|bike| bikes << bike.fix}
		# self.bikes.each {|bike| van.bikes << bike.fix}
		# broken_bikes.each {|bike| bikes << bike.fix}
	end


end