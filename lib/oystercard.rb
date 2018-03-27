class Oystercard

  attr_reader :balance

  DEFAULT_BALANCE = 0.0
  MAXIMUM_BALANCE = 90.0

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    max_balance_error = "Cannot top up past maximum value of £#{MAXIMUM_BALANCE}"
    raise max_balance_error if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
end
