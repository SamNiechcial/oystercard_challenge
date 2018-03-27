class Oystercard

  attr_reader :balance
  attr_reader :in_journey

  DEFAULT_BALANCE = 0.0
  MAXIMUM_BALANCE = 90.0
  MINIMUM_FARE = 1

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    max_balance_error = "Cannot top up past maximum value of £#{MAXIMUM_BALANCE}"
    raise max_balance_error if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    min_fare_error = "You need £#{Oystercard::MINIMUM_FARE} to begin your journey"
    raise min_fare_error if (@balance < MINIMUM_FARE)
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
