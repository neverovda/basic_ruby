class Railway

  attr_accessor :stations, :routes, :trains, :wagons

  def initialize
    @stations = []
    @routes = []
    @trains = []
    @wagons = []   
  end

  def enough_station?
    @stations.length > 1
  end

end
