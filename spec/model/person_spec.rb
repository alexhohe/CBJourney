require 'spec_helper'
require_relative '../../lib/Person.rb'

describe "A Person" do 

	it "can give you it's inventory" do
		
		person = Person.new(person_attributes)

		inventory = person.inventory

		expect(inventory.class).to eq({test: 'data'}.class)

	end
	
	it "can tell you how much cash they have" do 
	
		person = Person.new(person_attributes)

		expect(person.cash).to eq(1000.00)

	end

	it "can receive more cash and store the updated value" do
		person = Person.new(person_attributes)		

		person.get_payed(50.50)
		
		expect(person.cash).to eq(1050.50)
	end

	it "can tell you their location" do 
		person = Person.new(person_attributes)		

		expect(person.location.class).to eq("".class)
	end
	
end