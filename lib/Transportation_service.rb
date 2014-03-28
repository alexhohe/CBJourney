class Transportation_service

	def self.to(actor,destination)
		if can_afford?(actor, destination)
			actor.pay cost_to(actor.location, destination)
			actor.location = destination
		else
			raise TooBrokeError
		end		
	end

	def self.can_afford?(actor,destination)
		actor.cash >= cost_to(actor.location,destination)
	end

	def self.cost_to (origin,destination)
		origin.cost_to(destination)
	end
end

class TooBrokeError < StandardError
end