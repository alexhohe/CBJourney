require 'spec_helper'

describe "A Person" do 

	it "can give you it's inventory" do
		
		person = Person.new

		inventory = person.inventory

		expect(inventory.class).to eq({}.class)

	end
	
	it "can give you it's wallet" do 
	
	end
	
end