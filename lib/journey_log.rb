require_relative 'journey'

class JourneyLog

  attr_reader :journey, :journey_history

  def initialize
    @journey = Journey.new
    @journey_history = []
  end

  def start(entry_station)
    journey.start(entry_station)
    journey_history << {entry_station: entry_station}
  end

  def end(exit_station)
    journey.end(exit_station)
  end
end
