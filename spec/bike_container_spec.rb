require_relative '../lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do 

	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new}

	def fill_holder(holder)
		holder.capacity.times { holder.dock(Bike.new) }
	end

	it "should accept bikes" do 
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end

	it "should release bikes" do  
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)
	end

	it "should know when its full" do 
		expect(holder).not_to be_full
		fill_holder(holder)
		expect(holder).to be_full
	end

	it "should not accept bike if full" do 
		fill_holder(holder)
		expect {holder.dock(bike)}.to raise_error(RuntimeError)
	end

	it "should provide list of available bikes" do 
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

	it "should not release if there are no bikes" do 
		expect { holder.release(bike) }.to raise_error(RuntimeError)
	end

	it "should provide list of broken bikes" do 
		working_bike, broken_bike = Bike.new, Bike.new 
		broken_bike.break
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.broken_bikes).to eq([broken_bike])
	end

	it "should release broken bikes" do 
		broken_bike = Bike.new
		broken_bike.break
		holder.dock(broken_bike)
		expect(holder.release_broken_bikes(holder.broken_bikes)).to eq([broken_bike])
		expect(holder.broken_bikes).to eq([])
	end


end