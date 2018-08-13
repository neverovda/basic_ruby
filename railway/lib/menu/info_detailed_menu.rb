class InfoDetailedMenu < BasisMenu
  TEXT_MENU = ['1. Passenger trains',
               '2. Cargo trains',
               '3. All',
               '0. Return'].freeze

  def initialize
    @station = selection(Station.all, 'station')
    start if @station
  end

  def start
    commands = { 1 => :passenger_trains,
                 2 => :cargo_trains,
                 3 => :all,
                 0 => :return_from_menu }
    execute_menu(TEXT_MENU, commands)
  end

  def passenger_trains
    print_trains(@station.get_train_list(:passenger))
  end

  def cargo_trains
    print_trains(@station.get_train_list(:cargo))
  end

  def all
    print_trains(@station.get_train_list(:all))
  end

  def print_trains(trains)
    trains.each { |train| puts train.number + ' | ' + train.manufacturer }
  end
end
