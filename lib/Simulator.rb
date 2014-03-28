require_relative 'Menu'

class Simulator

	attr_accessor :person,:locations

	def initialize(person,locations)
		@person = person
		@locations = locations
	end

	def run
		menu = MainMenu.new(self)
		menu.run		
	end

	def current_location
		person.location
	end

	def display_status
		person.to_s
	end

end