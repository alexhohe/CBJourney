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
		end while handle_input(input)
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