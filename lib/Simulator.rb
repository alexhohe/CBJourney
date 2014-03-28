require_relative 'Menu'

class Simulator

	attr_accessor :person,:locations

	def initialize(person,locations)
		@person = person
		@locations = locations
	end

	def run
		puts welcome_message
		menu = MainMenu.new(self)
		menu.run		
	end

	def current_location
		person.location
	end

	def display_status
		person.to_s
	end

	def product_summary
		"SIM TEST"
		puts person.products.summary
	end

	def welcome_message
		"OH that's right! You're #{person.name}, the finest sales rep we've seen in years. But to prove yourself you've got to buy and sell products to get to chicago with the most cash possible. Make sure to look for deals, not all cities pay the same for all products."
	end
end