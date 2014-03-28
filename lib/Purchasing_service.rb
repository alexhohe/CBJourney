class Purchasing_service

	def self.process_transaction(person,location,action,product,quantity)

		unit_cost = location.local_price(product)

		amount = unit_cost * quantity

		case action.downcase
		when "buy"
			if can_afford?(person,amount)
				person.pay(amount)
				person.products.gain(quantity,product)		
				puts "You paid $#{amount} for #{quantity} #{product}"
			else
				puts "You can't afford that."
			end
		when "sell"
			if has_enough?(person,product,quantity)
				person.get_paid(amount)
				person.products.lose(quantity,product)		
				puts "You sold #{quantity} #{product} for $#{amount}"
			else
				puts "You don't have that many."				
			end
		end
		true
	end	

	def self.can_afford?(actor, amount)
		actor.cash >= amount
	end

	def self.has_enough?(actor, product, quantity)
		actor.products.has_enough?(product,quantity)
	end

end