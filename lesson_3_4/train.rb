class Train
  
  attr_accessor :speed 
  attr_reader :number
 
  def initialize(number, amp_wagons = 0)
    @number = number
    @amp_wagons = amp_wagons
    @speed = 0  
  end

  def stop
    @speed = 0
  end
  
  def length
    puts "Train's lenght #{@amp_wagons} wagons"
  end
  
  def add_wagon 
     @amp_wagons += 1 if @speed == 0 
  end    

  def remove_wagon 
     @amp_wagons -= 1 if @amp_wagons != 0 && @speed == 0
  end

  def set_route(route)
    @route = route
    set_station(@route.stations[0])
  end

  def set_station(station)
     @current_station.departure(self) if @current_station
     @current_station = station
     @current_station.arrival(self)
     @index_station = @route.stations.index(@current_station)
  end

  def first_station? 
    @index_station == 0
  end

  def last_station? 
    @index_station == @route.stations.length - 1
  end 

  def go_back
    set_station(@route.stations[@index_station - 1]) if !first_station? 
  end

  def go_forth
    set_station(@route.stations[@index_station + 1]) if !last_station?   
  end

  def messege_for_passegers
    puts "Previous station #{@route.stations[@index_station - 1].name}" if !first_station?
    puts "Current station: #{@current_station.name}"
    puts "Next station: #{@route.stations[@index_station + 1].name}" if !last_station?  
  end

end
