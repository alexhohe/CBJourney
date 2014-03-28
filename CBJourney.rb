require_relative 'lib/Person.rb'
require_relative 'lib/Location.rb'
require_relative 'lib/Simulator.rb'
require_relative 'lib/Product.rb'

puts "Oh hello there. What was your name again?"
name = gets.chomp
starting_cash = 2000.00
location = Locations.get(0)
products = Products.new(10,0,0)
person = Person.new({name: name, cash: starting_cash, location: location, products:products})

simulator = Simulator.new(person, LOCATIONS)
simulator.run