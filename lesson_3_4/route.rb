class Route
  
  attr_reader :stations

  def initialize(name ,f_station, l_station)
    @name = name
    @stations = [f_station, l_station]
    puts "Route #{@name} created:"    
  end

  def add_station(station)
    @stations.insert(-2, station)
    puts "#{station.name} added to route #{@name}."    
  end

  def delete_station(station)
    if (station != @stations.first || station != @stations.last) 
      del_station = @stations.delete(station)
      puts "#{station.name} deleted from route #{@name}." if del_station  
    end
  end

  def get_route_list
    puts "Route #{@name} list:"
    @stations.each { |station| puts station.name }
  end

end
