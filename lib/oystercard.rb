require 'pry'
require_relative 'station'
require_relative 'journey'

class OysterCard
  attr_reader :balance, :journeys, :entry_station, :exit_station
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

  def touch_in(entry_station)
    raise "Insufficent funds" if @balance < MINIMUM_FARE
    @entry_station = entry_station
  end

  def touch_out(entry_station, exit_station, journey = Journey.new)
    journey.start_journey
    deduct(MINIMUM_FARE)
    @journeys << {entry_station_name: entry_station.name, entry_station_zone: entry_station.zone, exit_station_name: exit_station.name, exit_station_zone: exit_station.zone}
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




binding.pry
