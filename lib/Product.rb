class Product

	attr_accessor :name, :quantity

	def initialize(name,quantity)
		@name = name
		@quantity = quantity
	end



end

class Products

	attr_accessor :mylist

	def initialize(jobs,rdb,talent_network)
		@mylist = {
			jobs: Product.new("Jobs",jobs),
			rdb: Product.new("RDB",rdb),
			talent_network: Product.new("Talent Network",talent_network)
		}
	end

	def gain(quantity,product)
				
		case product.downcase
		when "jobs"
			inventory = mylist[:jobs]
		when "rdb"
			inventory = mylist[:rdb]
		when "talent network"
			inventory = mylist[:talent_network]
		end
		
		inventory.quantity += quantity
	end

	def lose(quantity,product)
				
		case product.downcase
		when "jobs"
			inventory = mylist[:jobs]
		when "rdb"
			inventory = mylist[:rdb]
		when "talent network"
			inventory = mylist[:talent_network]
		end
		
		inventory.quantity -= quantity
	end

	def summary
		"#{mylist[:jobs].quantity} Job(s)\n#{mylist[:rdb].quantity} RDB(s)\n#{mylist[:talent_network].quantity} Talent Network(s)"
	end

	def has_enough?(product,quantity)
		case product.downcase
		when "jobs"
			inventory = mylist[:jobs]
		when "rdb"
			inventory = mylist[:rdb]
		when "talent network"
			inventory = mylist[:talent_network]
		end
		
		inventory.quantity >= quantity
	end

	def empty?
		not mylist.values.map{|prod| prod.quantity > 0}.include?(true)
	end

end