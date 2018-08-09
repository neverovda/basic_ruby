require_relative 'instance_counter'
require_relative 'validation'
require_relative 'station'
require_relative 'route'
require_relative 'manufacturer'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'seed'

class TextInterface

  def main_menu
    
    loop do
      explanation
      puts "1. Create an object (station, route, train, wagon)"
      puts "2. Manage a route"
      puts "3. Manage a train"
      puts "4. Manage a wagon"
      puts "5. Information"
      puts "0. Exit"
      
      case get_selection_number
      when 1
        create_objects
      when 2
        manage_route        
      when 3
        manage_train
      when 4
        manage_wagon
      when 5  
        get_info
      when 0
        puts "Goodbay!"
        break
      end

    end  
  end   

  def create_objects 
    loop do
      begin
        break if attempt_to_create == "exit from menu" 
        rescue RuntimeError => e
        puts e.message
        puts "Try again" 
      end 
    end
  end

  def attempt_to_create
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
      return "exit from menu"     
    end
  end  
    

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

  def enter_number
    puts "Enter number"
    gets.chomp
  end

  def make_station
    name = Station.new(enter_name).name
    puts "Station: #{name} created"
  end

  def make_route
    if Station.enough_stations?
      Route.new(enter_name, selection(Station.all, "firts station"), selection(Station.all, "last station"))
    else 
      puts "Stations must be at least two"
    end       
  end

  def make_train
    type = choose_type
    CargoTrain.new(*set_number_and_manufacturer) if type == :cargo
    PassengerTrain.new(*set_number_and_manufacturer) if type == :passenger
    puts "Train created"
  end

  def make_wagon
    type = choose_type
    CargoWagon.new(*set_number_and_manufacturer, enter_amt) if type == :cargo
    PassengerWagon.new(*set_number_and_manufacturer, enter_amt_seats) if type == :passenger
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

  def set_number_and_manufacturer
    [enter_number, selection(Manufacturer::MANUFACTURERS, "manufacturer")]
  end

  def enter_amt_seats
    puts "Enter amount seats"
    gets.chomp.to_i
  end

  def enter_amt
    puts "Enter max amount"
    gets.chomp.to_f
  end      

  def selection(arr, text)
    
    explanation
    puts "Choose #{text}"
    
    i = 1
    arr.each {|item| 
      puts "#{i}. #{type_of_info(item)}"
      i += 1
    }

    puts "The list of objects is empty. Create objects" if arr.length == 0

    arr[get_selection_number-1]

  end

  def type_of_info(obj)
    return obj.name if obj.instance_variables.include?(:@name)
    return obj.number if obj.instance_variables.include?(:@number)
    return obj
  end  

  def manage_route
    rout = selection(Route.all, "route")

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
    station = rout.add_station(selection(Station.all, "station"))
    puts "#{station.name} added to route #{@name}."
  end

  def delete_station(rout)
    station = rout.delete_station(selection(rout.get_intermediate_stations, "station"))
    puts "#{station.name} deleted." if station
  end

  def manage_train
    train = selection(Train.all, "train")

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
        begin
          add_wagon(train)
          rescue RuntimeError => e
          puts e.message
          puts "Try again"
        end 
      when 3
        delete_wagon(train)  
      when 4
        train.go_forth
        message_of_arrival(train)
      when 5
        train.go_back
        message_of_arrival(train) 
      when 0
        break    
      end
    end
  end

  def message_of_arrival(train)
    puts "The train came to the station #{train.current_station.name}."
  end  

  def assign_route(train)
    train.set_route(selection(Route.all, "route"))
  end

  def add_wagon(train)
    wagon = train.add_wagon(selection(Wagon.all {|wagon| wagon.free?}, "wagon"))
    puts "#{wagon.number} added" if wagon  
  end

  def delete_wagon(train)
    wagon = train.remove_wagon
    puts "#{wagon.number} deleted" if wagon  
  end
  
  def get_info
    loop do
      explanation
      puts "1. List of trains (number, type, length)"
      puts "2. List of trains (by type with manufacturer)"
      puts "3. list of wagons"
      puts "0. Exit"
      
      case get_selection_number
      when 1
        list_of_trains
      when 2
        list_of_trains_by_type  
      when 3
        list_of_wagons        
      when 0
        break
      end

    end
  end

  def list_of_trains
    station = selection(Station.all, "station")
    station.each_train { |train| puts "#{train.number} #{train.type.to_s} #{train.wagons.length}"}          
  end

  def list_of_wagons
    train = selection(Train.all, "train")
    train.each_wagon do |wagon| 
      puts "#{wagon.number} amount: #{wagon.amount} free amount: #{wagon.free_amount}" if wagon.type == :cargo
      puts "#{wagon.number} amount seats: #{wagon.amt_seats} free seats: #{wagon.amt_free_seats}" if wagon.type == :passenger
    end    
  end      

  def list_of_trains_by_type
    station = selection(Station.all, "station")

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
    trains.each {|train| puts train.number + ' | ' +  train.manufacturer_name}    
  end

  def manage_wagon
    manage_wagon_attempt
    rescue RuntimeError => e
    puts e.message
    puts "Try again"
  end

  def manage_wagon_attempt
    wagon = selection(Wagon.all, "wagon")  
    while wagon do
      explanation
      puts "1. Add passenger"
      puts "2. Add cargo"
      puts "0. Return"
      case get_selection_number
      when 1
        add_passenger(wagon)  
      when 2
        add_cargo(wagon) 
      when 0
        break    
      end
    end  
  end

  def add_passenger(wagon)
    if wagon.type != :passenger
      puts "This is not a passenger wagon"
      return
    end   
    wagon.occupate_seat
  end

  def add_cargo(wagon)
    if wagon.type != :cargo
      puts "This is not a cargo wagon"
      return
    end
    puts "Enter amount of cargo"
    wagon.fill(gets.chomp.to_f) 
  end 

end

seed
text_interface = TextInterface.new
text_interface.main_menu
