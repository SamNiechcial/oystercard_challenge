# This class defines an instance of Oystercard and the actions upon it
class Oystercard
  attr_reader :balance
  attr_reader :entry_station

  DEFAULT_BALANCE = 0.0
  MAXIMUM_BALANCE = 90.0
  MINIMUM_FARE = 1

  def initialize(balance = DEFAULT_BALANCE)
    max_bal_err = "Cannot create card with more than £#{MAXIMUM_BALANCE}"
    raise max_bal_err if balance > MAXIMUM_BALANCE
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    max_bal_error = "Cannot top up past £#{MAXIMUM_BALANCE}"
    raise max_bal_error if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    min_fare_error = "You need £#{Oystercard::MINIMUM_FARE} to begin journey"
    raise min_fare_error if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end
end

private

def deduct(amount)
  @balance -= amount
end
