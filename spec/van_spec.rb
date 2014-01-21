require_relative '../lib/van'

describe Van do 

	let(:van) {Van.new(:capacity => 5)}

	it "should allow setting default capacity on initialising" do
		expect(van.capacity).to eq(5)
	end
end