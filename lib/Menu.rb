require_relative 'Transportation_service'
require_relative 'Purchasing_service'

class Menu

	attr_reader :simulator, :options 
	attr_accessor :header

	def initialize(simulator)
		@simulator = simulator
		@options = build_options
	end

	def build_options
		raise "menu.build_options not set"
	end

	def run
		begin		
			puts "----------------------\n"
			display_header	
			display_options
			input = gets.chomp
			puts "----------------------\n"			
		end while handle_input(input) and not win_conditions_met?
	end

	def display_options
		puts options.map.with_index{|value,index| "#{index+1}) #{value.to_s}"}.join("\n")
	end

	def handle_input(input)
		case input.downcase
		when "quit","exit","back"
			false
		else	
			puts "That wasn't an option, silly!"
			true
		end					
	end

	def status
		puts simulator.display_status
	end

	def display_header
		puts status
	end

	def win_conditions_met?
		if not simulator.current_location.can_afford_any_products?(simulator.person.cash) and simulator.person.out_of_product? and not simulator.current_location.can_travel_anywhere?(simulator.current_location,simulator.person.cash)
			puts "You're out things to sell, too broke to buy more, and too broke to travel. You live on the streets now. Good luck righting the rats for food."
			true
		end

		if simulator.current_location.is_the_end?
			puts "You've done it! You got to #{simulator.current_location} and even have $#{simulator.person.cash} to spare! Enjoy a night night out on the town and some McDonald's on me. You did good #{simulator.person.name}."
			true
		end
	end

end

class MainMenu < Menu

	def build_options
		[
			"Buy and Sell Products",
			"Travel",

			"Quit"
		]
	end

	def handle_input(input)

		case input
		when "1"
			nextMenu = ShopMenu.new(simulator)
			nextMenu.run
			true
		when "2"
			nextMenu = TravelMenu.new(simulator)
			nextMenu.run
			true
		when options.length.to_s
			puts "You gave up with $#{simulator.person.cash} to your name in #{simulator.current_location}."
			false
		else
			super
		end
	end

end

class TravelMenu < Menu

	attr_reader :menu_locations

	def build_options
		@menu_locations = Locations.all - [simulator.current_location]

		list = menu_locations.map{|loc|
			loc.display_with_cost_to_travel(simulator.current_location)
		}
		list << "Back"
	end

	def handle_input(input)
		case input
		when "1".."#{options.length-1}"
			Transportation_service.to(simulator.person,menu_locations[input.to_i-1])
			false
		when options.length.to_s
			false
		else	
			super
		end					
	end	

end

class ShopMenu < Menu

	def display_header
		super
		# puts simulator.person.product_summary
		puts simulator.product_summary
		puts simulator.current_location.get_price_display
	end

	def build_options
		["Buy Jobs","Buy RDB","Buy Talent Network","Sell Jobs","Sell RDB","Sell Talent Network","Back"]
	end

	def handle_input(input)
		case input
		when "1"
			action = "Buy"
			product = "Jobs"
			quantity = get_quantity(action,product)
			Purchasing_service.process_transaction(simulator.person,simulator.current_location, action,product,quantity)

		when "2"
			action = "Buy"
			product = "RDB"
			quantity = get_quantity(action,product)
			Purchasing_service.process_transaction(simulator.person,simulator.current_location, action,product,quantity)
		when "3"
			action = "Buy"
			product = "Talent Network"
			quantity = get_quantity(action,product)
			Purchasing_service.process_transaction(simulator.person,simulator.current_location, action,product,quantity)
		when "4"
			action = "Sell"
			product = "Jobs"
			quantity = get_quantity(action,product)
			Purchasing_service.process_transaction(simulator.person,simulator.current_location, action,product,quantity)
		when "5"
			action = "Sell"
			product = "RDB"
			quantity = get_quantity(action,product)
			Purchasing_service.process_transaction(simulator.person,simulator.current_location, action,product,quantity)
		when "6"
			action = "Sell"
			product = "Talent Network"
			quantity = get_quantity(action,product)
			Purchasing_service.process_transaction(simulator.person,simulator.current_location, action,product,quantity)
		when options.length.to_s
			false
		else
			super
		end
	end

	def get_quantity(action,name)
		puts "#{action} how many #{name}?"
		gets.chomp.to_i
	end

end