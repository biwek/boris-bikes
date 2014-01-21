require_relative '../lib/bike'

describe "Bike" do 

	it "should not be broken after its created" do 
		bike = Bike.new
		# a method broken that should return false
		expect(bike).not_to be_broken
		# same as=> expect(bike.broken?).to be_false
	end

	it "should be able to break" do
		bike = Bike.new
		bike.break
		expect(bike).to be_broken
	end

end