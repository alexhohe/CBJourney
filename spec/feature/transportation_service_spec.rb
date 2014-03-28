require 'spec_helper'

describe "The Transportaion service" do 

	it "moves a person to the new location" do	
		person = Person.new(person_attributes)

		destination = Location.new("Los Angeles, CA", -1000, 175)

		Transportation_service.to(person, destination)

		expect(person.location.to_s).to include("Los Angeles, CA")
	end

	it "can tell you if a person has enough money to travel" do
		person = Person.new(person_attributes({cash: 510.00}))

		destination = Location.new("Los Angeles, CA", -1000, 175)

		true.should be(Transportation_service.can_afford?(person, destination))
	end

	it "can tell you if a person does not have enough money to travel" do
		person = Person.new(person_attributes({cash: 0.00}))

		destination = Location.new("Los Angeles, CA", -1000, 175)

		true.should_not be(Transportation_service.can_afford?(person, destination))	
	end

	it "prevents travel is a person does not have enough money" do

		begin
			
			person = Person.new(person_attributes({cash: 0.00}))
			
			destination = Location.new("Los Angeles, CA", -1000, 175)

			Transportation_service.to(person, destination)			
			
			#You shouldn't get here, because you're broke!
			fail 

		rescue TooBrokeError
			#This is what we wanted!
			true.should be(true)
		end
	end

	it "reduces that person's money before they travel" do
	
		person = Person.new(person_attributes)
			
		starting_cash = person.cash

		destination = Location.new("Dallas, TX", -500, 175)

		Transportation_service.to(person, destination)	

		expect(person.cash).to be < starting_cash

	end
	
end