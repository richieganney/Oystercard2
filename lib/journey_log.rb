class JourneyLog
  
  def initialize
    @all_journeys = []
  end

  def log_journey
    @all_journeys
  end

  def fare
    h = [@all_journeys[-1].values[1], @all_journeys[-1].values[3]].sort
    (h[-1] - h[0]) + 1
  end

end

