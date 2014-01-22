require_relative '../lib/van'

describe Van do 

	let(:van) {Van.new(:capacity => 5)}
	let(:bike) {Bike.new}
	let(:station) {DockingStation.new}
	let(:garage) {Garage.new}

	it "should allow setting default capacity on initialising" do
		expect(van.capacity).to eq(5)
	end

	it "should take broken bikes" do 
		working_bike, broken_bike1, broken_bike2 = Bike.new, Bike.new, Bike.new
		broken_bike1.break
		broken_bike2.break
		station.dock(broken_bike1)
		station.dock(broken_bike2)
		station.dock(working_bike)
		van.take_broken_bikes(station)
		expect(station.broken_bikes).to be_empty
		expect(station.bikes).to include(working_bike)
		expect(van.bikes).to eq([broken_bike1, broken_bike2])
	end

	it "should move fixed bikes from garage to station" do
		broken_bike1, broken_bike2 = Bike.new, Bike.new
		broken_bike1.break
		broken_bike2.break
		garage.dock(broken_bike1)
		garage.dock(broken_bike2)
		expect(garage.bikes).to eq([broken_bike1, broken_bike2])
		# garage.fix_broken_bikes(van)
		broken_bike1.fix 
		broken_bike2.fix
		van.move_fixed_bikes(garage, station)
		# expect(van.bikes).to eq([broken_bike1, broken_bike2])
		expect(garage.bikes).to eq([])
		expect(station.bikes).to eq([broken_bike1, broken_bike2])
	end

end