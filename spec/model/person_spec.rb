require 'spec_helper'


describe "A Person" do 

	it "can give you it's inventory" do
		
		person = Person.new(person_attributes)

		products = person.products

		expect(products.class).to eq(Products)

	end
	
	it "can tell you how much cash they have" do 
	
		person = Person.new(person_attributes)

		expect(person.cash).to eq(10000.00)

	end

	it "can receive more cash and store the updated value" do
		person = Person.new(person_attributes)		

		person.get_paid(50.50)
		
		expect(person.cash).to eq(10050.50)
	end

	it "can tell you their location" do 
		person = Person.new(person_attributes)		

		expect(person.location.class).to eq(Location)
	end
	
end