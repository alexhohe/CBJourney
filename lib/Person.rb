class Person

	attr_reader :products, :name, :cash
	attr_accessor :location

	def initialize(params)
		@name = params[:name]

		@products = params[:products]

		@cash = params[:cash]

		@location = params[:location]
	end
	
	def get_paid(money)
		@cash = (cash + money)
	end

	def pay(money)
		@cash = (cash - money)
	end

	def current_location
		location
	end

	def to_s
		"#{name}\n$#{cash.round(2)}\n@#{location}"
	end

	def product_summary
		products.summary
	end

	def can_afford?(amount)
		cash >= amount
	end

end
