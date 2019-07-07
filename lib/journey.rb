class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  attr_reader :journey

  def initialize
    @journey = false
  end

  def start_journey
    @journey = true
  end

  def end_journey
    @journey = false
  end

  def journey_complete?
    return true if @journey == false
  end

  def fare
    MINIMUM_FARE
  end

  def penalty_fare
    PENALTY_FARE
  end

end
