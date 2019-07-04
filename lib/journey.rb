class Journey

  def initialize
    @journey = nil
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
end
