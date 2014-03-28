require_relative 'lib/Person.rb'
require_relative 'lib/Location.rb'
require_relative 'lib/Simulator.rb'


name = "Alex Hohe"
starting_cash = 1000.00
location = Locations.get(0)
person = Person.new({name: name, cash: starting_cash, location: location})

simulator = Simulator.new(person, LOCATIONS)
simulator.run