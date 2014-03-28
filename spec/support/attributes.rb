def person_attributes(overrides = {})
	{
		name: "Alex Hohe",
		cash: 1000.00,
		location: Location.new("Atlanta, GA",0,0)
	}.merge(overrides)
end