class Person

attr_reader :inventory, :name, :location

def initialize(params)
	@name = params[:name]

	@inventory = {
		cash: params[:cash]
		}

		@location = params[:location]
end

def cash
	inventory[:cash]
end

def get_payed(money)
	inventory.store(:cash, (cash + money))
end

def current_location
	location
end

end
