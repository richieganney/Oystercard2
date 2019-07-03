class OysterCard
  attr_reader :balance, :entry_station
  DEFAULT_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @entry_station
    @balance = 0
  end

  def top_up(amount)
    raise 'Top-Up Limit Reached!' if @balance + amount  >= DEFAULT_LIMIT
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficent funds" if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def journey?
    !!entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
