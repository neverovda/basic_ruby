require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'railway'
#require_relative 'seed'

class TextInterface

  def initialize
    @rail_way = Railway.new
    #seed(@rail_way)
  end

  def main_menu
    
    loop do
      explanation
      puts "1. Create an object (station, route, train, wagon)"
      puts "2. Manage a route"
      puts "3. Manage a train"
      puts "4. Information about trains on stations"
      puts "0. Exit"
      
      case get_selection_number
      when 1
        create_objects
      when 2
        manage_route        
      when 3
        manage_train
      when 4  
        get_info
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
    puts "<<< Enter the number of the item >>>"
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
      @rail_way.routes << Route.new(enter_name, selection(@rail_way.stations, "firts station"), selection(@rail_way.stations, "last station"))
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

  def selection(arr, text)
    
    explanation
    puts "Choose #{text}"
    
    i = 1
    arr.each {|item| 
      puts "#{i}. #{item.name}"
      i += 1
    }

    puts "The list of objects is empty. Create objects" if arr.length == 0

    arr[get_selection_number-1]

  end

  def manage_route
    rout = selection(@rail_way.routes, "route")

    while rout do
      explanation
      puts "1. Add a station"
      puts "2. Delete a station"
      puts "0. Return"

      case get_selection_number
      when 1
        add_station(rout)  
      when 2
        delete_station(rout)
      when 0
        break    
      end
    end 
  end

  def add_station(rout)
    station = rout.add_station(selection(@rail_way.stations, "station"))
    puts "#{station.name} added to route #{@name}."
  end

  def delete_station(rout)
    station = rout.delete_station(selection(rout.get_intermediate_stations, "station"))
    puts "#{station.name} deleted." if station
  end

  def manage_train
    train = selection(@rail_way.trains, "train")

    while train do
      explanation
      puts "1. Assingn a route"
      puts "2. Add wagon"
      puts "3. Delete wagon"
      puts "4. Go forward"
      puts "5. Go back"
      puts "0. Return"

      case get_selection_number
      when 1
        assign_route(train)  
      when 2
        add_wagon(train)
      when 3
        delete_wagon(train)  
      when 4
        train.go_forth
      when 5
        train.go_back 
      when 0
        break    
      end
    end
  end

  def assign_route(train)
    train.set_route(selection(@rail_way.routes, "route"))
  end

  def add_wagon(train)
    wagon = train.add_wagon(selection(@rail_way.wagons.select {|wagon| wagon.free?}, "wagon"))
    puts "#{wagon.name} added" if wagon  
  end

  def delete_wagon(train)
    wagon = train.remove_wagon
    puts "#{wagon.name} deleted" if wagon  
  end
  
  def get_info
    station = selection(@rail_way.stations, "station")

    while station do
      explanation
      puts "1. Passenger trains"
      puts "2. Cargo trains"
      puts "3. All"
      puts "0. Return"
      case get_selection_number
      when 1
        print_trains(station.get_train_list(:passenger))  
      when 2
        print_trains(station.get_train_list(:cargo)) 
      when 3
        print_trains(station.get_train_list(:all))  
      when 0
        break    
      end
    end
  end

  def print_trains(trains)
    trains.each {|train| puts train.name}    
  end 


end 

text_interface = TextInterface.new
text_interface.main_menu
