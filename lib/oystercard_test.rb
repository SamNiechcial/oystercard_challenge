require './oystercard.rb'
require './journey.rb'
require './station.rb'

p oystercard = Oystercard.new
p oystercard.top_up(20)
p oystercard.touch_in(Journey.new("Cannon Street"))
p oystercard.touch_out("Whitechapel")

p journey = Journey.new("Cannon Street")
p journey.exit_station = "Whitechapel"

p journey
