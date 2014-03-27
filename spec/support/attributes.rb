def person_attributes(overrides = {})
	{
		name: "Alex Hohe",
		cash: 1000.00,
		location: "Atlanta,GA"
	}.merge(overrides)
end