class OysterCard
  attr_reader :balance, :entry_station, :exit_station, :journeys
  DEFAULT_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @entry_station
    @exit_station
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise 'Top-Up Limit Reached!' if @balance + amount  >= DEFAULT_LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Insufficent funds" if @balance < MINIMUM_FARE
    @entry_station = entry_station
  end

  def touch_out(entry_station, exit_station)
    deduct(MINIMUM_FARE)
    @journeys << {entry_station: entry_station, exit_station: exit_station}
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
