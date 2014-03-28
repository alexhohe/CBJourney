class Location

	attr_reader :name,:x,:y

	PRICE_PER_DISTANCE = 3.25

	def initialize(name,x,y)
		@name = name
		@x = x
		@y = y
	end

	def distance_to(destination)
		a = x - destination.x
		b = y - destination.y

		c = Math.sqrt(	(	(a**2) + (b**2) ) )
	end

	def to_s
		name
	end

	def cost_to(destination)
		(PRICE_PER_DISTANCE * distance_to(destination)).round(2)
	end

	def display_with_cost_to_travel(origin)
		"#{name} $#{origin.cost_to(self).to_s}"
	end

end

class Locations

	def self.all
		LOCATIONS
	end

	def self.get(index)
		LOCATIONS[index]
	end

	def self.to_menu

	end

end

LOCATIONS = [
		Location.new("Atlanta, GA",3375,8439),
		Location.new("Chattanooga, GA",3504,8526),
		Location.new("Nashville, TN",3616,8678),
		Location.new("Louisville, KY",3825,8576),
		Location.new("Indianapolis, IN", 3979,8614),
		Location.new("Chicago, IL", 4188,8762)
	]