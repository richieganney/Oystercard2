class JourneyLog
  
  def initialize
    @all_journeys = []
  end

  def log_journey
    @all_journeys
  end

<<<<<<< HEAD
  

end
=======
  def fare
    h = [@all_journeys[-1].values[1], @all_journeys[-1].values[3]].sort
    (h[-1] - h[0]) + 1
  end

end

>>>>>>> 4160e0d491774fda77a0a374f87870e5df0aed05
