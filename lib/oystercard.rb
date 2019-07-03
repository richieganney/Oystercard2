class OysterCard
  attr_reader :balance, :journeys
  DEFAULT_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise 'Top-Up Limit Reached!' if @balance + amount  >= DEFAULT_LIMIT
    @balance += amount
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
