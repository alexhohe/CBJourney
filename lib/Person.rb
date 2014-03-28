class Person

	attr_reader :inventory, :name, :cash
	attr_accessor :location

	def initialize(params)
		@name = params[:name]

		@inventory = {}

		@cash = params[:cash]

		@location = params[:location]
	end
	
	def get_payed(money)
		@cash = (cash + money)
	end

	def pay(money)
		@cash = (cash - money)
	end

	def current_location
		location
	end

	def to_s
		"#{name} has $#{cash.round(2)} and is in #{location}"
	end

end
