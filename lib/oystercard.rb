# This class defines an instance of Oystercard and the actions upon it
class Oystercard
  attr_reader :balance
  attr_reader :current_journey
  attr_reader :entry_station
  attr_reader :exit_station
  attr_reader :journey_history

  DEFAULT_BALANCE = 0.0
  MAXIMUM_BALANCE = 90.0
  MINIMUM_FARE = 1

  def initialize(balance = DEFAULT_BALANCE)
    max_bal_err if balance > MAXIMUM_BALANCE
    @balance = balance
    @journey_history = []
  end

  def top_up(amount)
    max_bal_err if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station, current_journey = Journey.new(entry_station))
    min_fare_error if balance_too_low
    @current_journey = current_journey
  end

  def touch_out(station)
    @current_journey.exit_station(station)
    @journey_history << @current_journey
    deduct(MINIMUM_FARE)
  end

  private

  # Error messages

  def max_bal_err
    raise "Cannot add more value than £#{MAXIMUM_BALANCE}"
  end

  def min_fare_error
    raise "You need £#{MINIMUM_FARE} to begin journey"
  end

  # Checkers

  def balance_too_low
    @balance < MINIMUM_FARE
  end

  def deduct(amount)
    @balance -= amount
  end

end

# [1] pry(main)> require './lib/oystercard.rb'
# => true
# [2] pry(main)> require './lib/journey.rb'
# => true
# [3] pry(main)> a = Oystercard.new(5)
# => #<Oystercard:0x00007ff6ab91fd08 @balance=5, @journey_history=[]>
# [4] pry(main)> a.touch_in('Bank')
# \=> #<Journey:0x00007ff6ab931468 @journey={"start"=>"Bank", "end"=>nil}>
# [5] pry(main)> a.current_journey.journey
# => {"start"=>"Bank", "end"=>nil}
# [6] pry(main)> a.current_journey.journey["end"] = 'Whitechapel'
# => "Whitechapel"
# [7] pry(main)> a.current_journey.journey
# => {"start"=>"Bank", "end"=>"Whitechapel"}
