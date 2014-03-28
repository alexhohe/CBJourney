def person_attributes(overrides = {})
	{
		name: "Alex Hohe",
		cash: 10000.00,
		products: Products.new(10,0,0),
		location: Location.new("Atlanta, GA",0,0)
	}.merge(overrides)
end

# [Product.new("RDB",0),Product.new("Jobs",10),Product.new("Talent Network",0)]