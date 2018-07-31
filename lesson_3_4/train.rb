class Train
  
  attr_accessor :speed 
  attr_reader :name
 
  def initialize(name)
    @name = name
    @amp_wagons = []
    @speed = 0  
  end

  def stop
    @speed = 0
  end
  
  def length
    puts "Train's lenght #{@amp_wagons.length} wagons"
  end
  
  def add_wagon(wagon)
    if @speed == 0 
      wagon.use!
      @amp_wagons << wagon
      wagon
    end
  end    

  def remove_wagon 
     @amp_wagons.pop if @amp_wagons.length != 0 && @speed == 0
  end

  def set_route(route)
    @route = route
    set_station(@route.stations[0])
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

  protected
  # в protected так как напрямую станция не устанавливается, либо при перемещение, либо при установке маршрута
  # наслудуется в дочерние классы поездов
  def set_station(station)
     @current_station.departure(self) if @current_station
     @current_station = station
     @current_station.arrival(self)
     @index_station = @route.stations.index(@current_station)
  end

  # в protected так как вспомогательный метод для движения, и вывода сообщения
  # наслудуется в дочерние классы поездов
  def first_station? 
    @index_station == 0
  end

  # в protected так как вспомогательный метод для движения, и вывода сообщения
  # наслудуется в дочерние классы поездов
  def last_station? 
    @index_station == @route.stations.length - 1
  end 

end
