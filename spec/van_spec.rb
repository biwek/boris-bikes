require_relative '../lib/van'

describe Van do 

	let(:van) {Van.new(:capacity => 5)}
	let(:bike) {Bike.new}
	let(:station) {DockingStation.new}

	it "should allow setting default capacity on initialising" do
		expect(van.capacity).to eq(5)
	end

	it "should take broken bikes" do 
		working_bike, broken_bike1, broken_bike2 = Bike.new, Bike.new, Bike.new
		broken_bike1.break
		broken_bike2.break
		station.dock(broken_bike1)
		station.dock(broken_bike2)
		van.take_broken_bikes(station.broken_bikes)
		expect(station.broken_bikes).to eq([])
		expect(van.bikes).to eq([broken_bike1, broken_bike2])

	end

end