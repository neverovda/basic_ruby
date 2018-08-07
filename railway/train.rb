class Train
  
  include Manufacturer
  include InstanceCounter
  include Validation

  attr_accessor :speed 
  attr_reader :number, :type, :current_station

  NUMBER_FORMAT = /^[a-z0-9]{3}-{0,1}[a-z0-9]{2}$/i

  @@trains = {}

  class << self
    
    def find(number)
      @@trains[number]
    end

    def all
      @@trains.values    
    end

  end  
 
  def initialize(number, manufacture_name)
    @number = number
    @amp_wagons = []
    @speed = 0
    set_manufacturer(manufacture_name)
    validate!
    @@trains[number] = self
    register_instance  
  end

  def stop
    @speed = 0
  end
  
  def length
    @amp_wagons.length
  end
  
  def add_wagon(wagon)
    check_addition(wagon)
    wagon.use!
    @amp_wagons << wagon
    wagon
  end

  def check_addition(wagon)
    raise "The train is moving !!!" if @speed != 0
    raise "This wagon is not #{@type.to_s}" if @type != wagon.type 
    true     
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

end
