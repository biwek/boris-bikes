require_relative '../lib/docking_station'

describe "DockingStation" do 

	let(:bike) { Bike.new }
	let(:station) { DockingStation.new }

	it "should accept bikes" do 
		expect(station.bike_count).to eq(0)
		station.dock(bike)
		expect(station.bike_count).to eq(1)
	end

	it "should release bikes" do  
		station.dock(bike)
		station.release(bike)
		expect(station.bike_count).to eq(0)
	end

end