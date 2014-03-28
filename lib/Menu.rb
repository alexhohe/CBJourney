require_relative 'Transportation_service'

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