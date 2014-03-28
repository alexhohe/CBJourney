class Transportation_service

	def self.to(actor,destination)
		cost = cost_to(actor.location,destination)
		if actor.can_afford?(cost)
			actor.pay cost_to(actor.location, destination)
			actor.location = destination
			puts "You paid #{cost} to get to #{destination}"
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