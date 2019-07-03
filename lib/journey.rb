require_relative 'oyster'

class Journey

attr_reader :entry_station, :exit_station

  def initialize
    @entry_station
    @exit_station
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

end
