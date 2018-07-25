class Station

  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
    puts "Station: #{@name} created"    
  end

  def arrival(train)
    @trains << train
    puts "The train number: #{train.number} came to the station #{@name}."
  end

  def departure(train)
    puts "The train number: #{train.number} departed from station: #{@name}." if @trains.include?(train)
    @trains.delete(train)
  end

  def get_train_list
    puts "Station: #{@name} Train list:"
    @trains.each { |train| puts train.number }
  end       

  def get_amt_trains_by_type
    passenger = 0
    cargo = 0
    @trains.each { |train| 
      passenger += 1 if train.type == "passenger"
      cargo += 1 if train.type == "cargo" 
    }   
    puts "Passenger trains amt :#{passenger}"
    puts "Cargo trains amt :#{cargo}"    
  end

end
 
class Route
  
  attr_reader :list_route

  def initialize(name ,f_station, l_station)
    @name = name
    @list_route = [f_station, l_station]
    puts "Route #{@name} created:"    
  end

  def add_station(station)
    @list_route.insert(-2, station)
    puts "#{station.name} added to route #{@name}."    
  end

  def delete_station(station)
    if (station != @list_route.first || station != @list_route.last) 
      del_station = @list_route.delete(station)
      puts "#{station.name} deleted from route #{@name}." if del_station  
    end
  end

  def get_route_list
    puts "Route #{@name} list:"
    @list_route.each { |station| puts station.name }
  end

end

class Train
  
  attr_accessor :speed 
  attr_reader :number, :type
 
  def initialize(number, type, amp_wagons = 0)
    @number = number
    @type = type
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
    @list_route = route.list_route 
    set_station(@list_route[0])
  end

  def set_station(station)
     @current_station.departure(self) if @current_station
     @current_station = station
     @current_station.arrival(self)
     @index_station = @list_route.index(@current_station)
  end

  def first_station? 
    @index_station == 0
  end

  def last_station? 
    @index_station == @list_route.length - 1
  end 

  def go_back
    set_station(@list_route[@index_station - 1]) if !first_station? 
  end

  def go_forth
    set_station(@list_route[@index_station + 1]) if !last_station?   
  end

  def messege_for_passegers
    puts "Previous station #{@list_route[@index_station - 1].name}" if !first_station?
    puts "Current station: #{@current_station.name}"
    puts "Next station: #{@list_route[@index_station + 1].name}" if !last_station?  
  end

end  

station_1 = Station.new("Ussuriysk")
station_2 = Station.new("Vladivostok")
station_3 = Station.new("Bolshoy Kamen")
station_4 = Station.new("Nakhodka")

route_1 = Route.new("Traveling by Primorye", station_1, station_4)

route_1.add_station(station_2)
route_1.add_station(station_3)
route_1.get_route_list

route_1.delete_station(station_3)
route_1.delete_station(station_3)
route_1.get_route_list

train1 = Train.new("Y-150", "passenger", 10)

train1.add_wagon
train1.length
train1.remove_wagon
train1.length
train1.speed = 50
train1.speed
train1.add_wagon
train1.length
train1.remove_wagon
train1.length

train1.stop
train1.set_route(route_1)
station_1.get_train_list

train1.messege_for_passegers
train1.go_forth
train1.messege_for_passegers
train1.go_forth
train1.go_forth
train1.go_forth
train1.messege_for_passegers

train1.go_back
train1.go_back
train1.go_back

train2 = Train.new("S-1", "passenger", 10)
train2.set_route(route_1)

train3 = Train.new("Y-200", "passenger", 10)
train3.set_route(route_1)

train4 = Train.new("G-010", "cargo", 10)
train4.set_route(route_1)

train5 = Train.new("G-010", "cargo", 10)
train5.set_route(route_1)

station_1.get_train_list
station_1.get_amt_trains_by_type
