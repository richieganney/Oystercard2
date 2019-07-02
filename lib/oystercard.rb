class Oystercard

attr_accessor :balance

BALANCE_LIMIT = 90
MINIMUM_FARE_LIMIT = 1

  def initialize(balance=0)
    @balance = balance
  end

  def top_up(amount)
    raise("amount exceeded, balance cannot be: #{amount + self.balance}. Balance limit is 90") if balance_check(amount)
    self.balance += amount
  end

  def balance_check(amount)
    amount + self.balance > BALANCE_LIMIT
  end

  def deduct(amount)
    self.balance -= amount
  end

  def touch_in
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  def in_journey?
    @in_use
  end

  def check_touch_in_out
    if touch_in
      minimum_fare_check
    end
  end

  def minimum_fare_check
    raise "Not enough funds, minimum balance required 1" if self.balance < MINIMUM_FARE_LIMIT
  end
end
