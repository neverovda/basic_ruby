require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'railway'

class TextInterface

  def initialize
    @rail_way = Railway.new
  end

  def main_menu
    
    loop do
      explanation
      puts "1. Create an object (station, route, train, wagon)"
      puts "2. Manage an objects"
      puts "3. Information about the object"
      puts "0. Exit"
      
      case get_selection_number
      when 1
        create_objects
      when 2
        manage_objects        
      when 3
        # информация об объекте
        puts @rail_way.stations
        puts @rail_way.routes
        puts @rail_way.trains
        puts @rail_way.wagons
        
      when 0
        puts "Goodbay!"
        break
      end

    end  
  end   

  def create_objects 
    
    loop do
    
      explanation
      puts "1. Create a station"
      puts "2. Create a route"
      puts "3. Create a train"
      puts "4. Create a wagon"
      puts "0. Return"

      case get_selection_number
      when 1
        make_station  
      when 2
        make_route
      when 3
        make_train
      when 4
        make_wagon
      when 0
        break    
      end

    end

  end

  # private  

  def explanation
    puts "Enter the number of the item"
  end

  def get_selection_number
    gets.chomp.to_i
  end

  def enter_name
    puts "Enter name"
    gets.chomp
  end

  def make_station
    @rail_way.stations << Station.new(enter_name)
    puts "Route #{@rail_way.stations.last.name} created:"
  end

  def make_route
    if @rail_way.enough_station?
      @rail_way.routes << Route.new(enter_name, selection(:stations), selection(:stations))
    else 
      puts "Stations must be at least two"
    end       
  end

  def make_train
    type = choose_type
    @rail_way.trains << CargoTrain.new(enter_name) if type == :cargo
    @rail_way.trains << PassengerTrain.new(enter_name) if type == :passenger
    puts "Train number: #{@rail_way.trains.last.number} created" 
  end

   def make_wagon
    type = choose_type
    @rail_way.wagons << CargoWagon.new if type == :cargo
    @rail_way.wagons << PassengerWagon.new if type == :passenger
    puts "Wagon created" 
  end

  def choose_type
    puts "Choose the type"
    puts "1. Cargo"
    puts "2. Passenger"
    number = get_selection_number
    return :cargo if number == 1
    return :passenger if number == 2 
  end  

  def selection(name_arr)
    
    arr = @rail_way.stations if name_arr == :stations  

    i = 1
    explanation
    arr.each {|item| 
      puts "#{i}. #{item.name}"
      i += 1
    }

    arr[get_selection_number-1]

  end  

end 

text_interface = TextInterface.new
text_interface.main_menu
