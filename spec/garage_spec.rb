require_relative '../lib/garage'

describe Garage do  

	let(:garage) { Garage.new(:capacity => 15) }

	it "should allow setting default capacity on initialising" do 
		expect(garage.capacity).to eq(15)
	end

end
