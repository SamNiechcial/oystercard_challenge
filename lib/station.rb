# This class defines stations for the purpose of calculating journey costs
class Station
  attr_reader :name
  attr_reader :zone

  def initialize(name, zone)
    @name = name
    @zone = zone
  end
end
