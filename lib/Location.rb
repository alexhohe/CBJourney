class Location

	attr_reader :name,:x,:y,
				:job_price,:rdb_price,:talent_network_price

	PRICE_PER_DISTANCE = 5.25

	def initialize(name,x,y,job_price=419,rdb_price=1000,talent_network_price=10000)
		@name = name
		@x = x
		@y = y

		@job_price = job_price
		@rdb_price = rdb_price
		@talent_network_price = talent_network_price

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

	def get_price_display
		"#{name} Prices\nJobs : $#{job_price}\nRDB : $#{rdb_price}\nTalent Network : $#{talent_network_price}\n"
	end

	def local_price(product)
		case product.downcase
		when "jobs"
			job_price
		when "rdb"
			rdb_price
		when "talent network"
			talent_network_price
		end
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
		Location.new("Chattanooga, GA",3504,8526,200,1100,9997),
		Location.new("Nashville, TN",3616,8678,419,600,12000),
		Location.new("Louisville, KY",3825,8576,525,1000,7500),
		Location.new("Indianapolis, IN", 3979,8614,410,1400,10000),
		Location.new("Chicago, IL", 4188,8762,650,1200,20000)
	]