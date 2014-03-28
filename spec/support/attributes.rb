def person_attributes(overrides = {})
	{
		name: "Alex Hohe",
		cash: 10000.00,
		location: Location.new("Atlanta, GA",0,0)
	}.merge(overrides)
end