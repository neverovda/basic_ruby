class CreatingMenu < BasisMenu
  TEXT_MENU = ['1. Create a station',
               '2. Create a route',
               '3. Create a train',
               '4. Create a wagon',
               '0. Return'].freeze

  def initialize
    commands = { 1 => :make_station,
                 2 => :make_route,
                 3 => :make_train,
                 4 => :make_wagon,
                 0 => :return_from_menu }

    execute_menu(TEXT_MENU, commands)
  end

  def make_station
    name = Station.new(enter_name).name
    puts "Station: #{name} created"
  end

  def make_route
    if Station.enough_stations?
      Route.new(enter_name, selection(Station.all, 'firts station'), selection(Station.all, 'last station'))
    else
      puts 'Stations must be at least two'
    end
  end

  def make_train
    type = choose_type
    CargoTrain.new(*set_number_and_manufacturer) if type == :cargo
    PassengerTrain.new(*set_number_and_manufacturer) if type == :passenger
    puts 'Train created'
  end

  def make_wagon
    type = choose_type
    CargoWagon.new(*set_number_and_manufacturer, enter_amt) if type == :cargo
    PassengerWagon.new(*set_number_and_manufacturer, enter_amt_seats) if type == :passenger
    puts 'Wagon created'
  end

  def set_number_and_manufacturer
    [enter_number, selection(Manufacturer::MANUFACTURERS, 'manufacturer')]
  end

  def enter_amt_seats
    puts 'Enter amount seats'
    gets.chomp.to_i
  end

  def enter_amt
    puts 'Enter max amount'
    gets.chomp.to_f
  end
end
