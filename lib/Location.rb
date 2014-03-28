class Location

attr_reader :name,:x,:y

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
end

