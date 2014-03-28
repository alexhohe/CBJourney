class Transportation_service

	def self.to(actor,destination)
		if actor.can_afford?(cost_to(actor.location,destination))
			actor.pay cost_to(actor.location, destination)
			actor.location = destination
		else
			puts "You're too broke for that."			
		end		
	end

	def self.cost_to (origin,destination)
		origin.cost_to(destination)
	end
end

class TooBrokeError < StandardError
end