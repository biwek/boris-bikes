require_relative '../lib/bike'

describe "Bike" do 

	let(:bike) {Bike.new}

	it "should not be broken after its created" do 
		# a method broken that should return false
		expect(bike).not_to be_broken
		# same as=> expect(bike.broken?).to be_false
	end

	it "should be able to break" do
		bike.break
		expect(bike).to be_broken
	end

	it "should be able to fix broken bike" do 
		bike.break 
		bike.fix
		expect(bike).not_to be_broken
	end

end