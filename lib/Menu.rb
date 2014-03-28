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

	def build_options
		list = Locations.all - [simulator.current_location]

		list = list.each{|loc|
			loc.display_with_cost_to_travel(simulator.current_location)
		}
		list << "Back"
	end

	def handle_input(input)
		case input
		when options.length.to_s
			false
		else	
			super
		end					
	end	

end