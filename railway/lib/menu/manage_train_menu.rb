class ManageTrainMenu < BasisMenu
  TEXT_MENU = ['1. Assingn a route',
               '2. Add wagon',
               '3. Delete wagon',
               '4. Go forward',
               '5. Go back',
               '0. Return'].freeze

  def initialize
    @train = selection(Train.all, 'train')
    start if @train
  end

  def start
    commands = { 1 => :assign_route,
                 2 => :add_wagon,
                 3 => :delete_wagon,
                 4 => :go_forth,
                 5 => :go_back,
                 0 => :return_from_menu }
    execute_menu(TEXT_MENU, commands)
  end

  def assign_route
    @train.route = selection(Route.all, 'route')
  end

  def add_wagon
    wagon = @train.add_wagon(selection(Wagon.all, 'wagon'))
    puts "#{wagon.number} added" if wagon
  end

  def delete_wagon
    wagon = @train.remove_wagon
    puts "#{wagon.number} deleted" if wagon
  end

  def go_forth
    @train.go_forth
    message_of_arrival
  end

  def go_back
    @train.go_back
    message_of_arrival
  end

  def message_of_arrival
    puts "The train came to the station #{@train.current_station.name}."
  end
end
