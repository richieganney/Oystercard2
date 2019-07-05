require 'pry'
require_relative 'station'
require_relative 'journey'

class OysterCard
  attr_reader :balance, :journey, :journey_log, :entry_station, :exit_station
  DEFAULT_LIMIT = 90
  MINIMUM_FARE = 1
  PENALTY_FARE = 6  

  def initialize(journey = Journey.new, journey_log = JourneyLog.new)
    @journey = journey
    @balance = 0
    @journey_log = journey_log
  end

  def top_up(amount)
    raise 'Top-Up Limit Reached!' if @balance + amount  >= DEFAULT_LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
    @journey.journey == true ? penalty_fare : @journey.start_journey
    raise "Insufficent funds" if @balance < MINIMUM_FARE
    @entry_station = entry_station
  end

  def touch_out(entry_station, exit_station)
    penalty_fare if @journey.journey == false
    @journey_log.log_journey << {entry_station_name: entry_station.name, entry_station_zone: entry_station.zone, exit_station_name: exit_station.name, exit_station_zone: exit_station.zone}
    deduct
    @entry_station = nil
    @journey.end_journey
  end

  def journey?
    !!entry_station
  end

  private

  def deduct
    @balance -= @journey_log.fare
  end

  def penalty_fare
    @balance -= @journey.penalty_fare
  end

end

# binding.pry
