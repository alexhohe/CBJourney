require 'spec_helper'

describe "A location" do

	it "will include it's name when required to flatten to string" do
		location = Location.new("Atlanta, GA",0,0)

		expect(location.to_s).to include("Atlanta, GA")
	end

	it "can tell you how far it is from another location" do
		location1 = Location.new("Atlanta, GA",100,100)
		location2 = Location.new("Greenville, SC", 100,200)

		expect(location1.distance_to(location2)).to eq(100)
	end

end