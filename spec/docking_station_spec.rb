require_relative '../lib/docking_station'

describe "DockingStation" do 

	let(:bike) { Bike.new }
	let(:station) { DockingStation.new(:capacity => 20) }

	def fill_station(station)
		20.times { station.dock(Bike.new) }
	end

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

	it "should know when its full" do 
		expect(station).not_to be_full
		fill_station(station)
		expect(station).to be_full
	end

	it "should not accept bike if full" do 
		fill_station(station)
		expect {station.dock(bike)}.to raise_error(RuntimeError)
	end

end