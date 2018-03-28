
class Journey
attr_reader :entry_station
attr_reader :exit_station
attr_reader :journey

  def initialize(entry_station, exit_station = nil)
    @journey = { 'start' => entry_station, 'end' => exit_station }
  end

  def exit_station(station)
     @journey[:end] = station

  end

end
