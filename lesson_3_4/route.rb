class Route
  
  attr_reader :stations, :name

  def initialize(name ,f_station, l_station)
    @name = name
    @stations = [f_station, l_station]        
  end

  def add_station(station)
    @stations.insert(-2, station)
    station    
  end

  def delete_station(station)
    if (station != @stations.first || station != @stations.last) 
      del_station = @stations.delete(station)        
    end
  end

  def get_intermediate_stations
    amt = @stations.length - 2
    @stations.slice(1, amt) || []  
  end

  def get_route_list
    puts "Route #{@name} list:"
    @stations.each { |station| puts station.name }
  end

end
