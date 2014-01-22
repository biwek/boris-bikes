require_relative '../lib/garage'

describe Garage do  

	let(:garage) { Garage.new(:capacity => 15) }
	let(:bike) {Bike.new}
	let(:van) {Van.new}
	let(:station) {DockingStation.new}

	it "should allow setting default capacity on initialising" do 
		expect(garage.capacity).to eq(15)
	end

	it "should collect bikes from van" do 
		broken_bike1, broken_bike2 = Bike.new, Bike.new
		broken_bike1.break
		broken_bike2.break
		van.dock(broken_bike1)
		van.dock(broken_bike2)
		expect(van.bikes).to eq([broken_bike1, broken_bike2])
		garage.collect_broken_bikes(van)
		expect(garage.bikes).to eq([broken_bike1, broken_bike2])
		expect(van.bikes).to eq([])
	end

	it "should fix bike when put in garage" do 
		broken_bike1 = Bike.new
		broken_bike1.break
		garage.dock(broken_bike1)
		garage.fix_broken_bikes(broken_bike1)
		expect(garage.available_bikes).to eq([broken_bike1])
		expect(garage.broken_bikes).to eq([])
	end

end
