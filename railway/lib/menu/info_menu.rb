class InfoMenu < BasisMenu
  TEXT_MENU = ['1. List of trains (number, type, length)',
               '2. List of trains (by type with manufacturer)',
               '3. list of wagons',
               '0. Return'].freeze

  def initialize
    commands = { 1 => :list_of_trains,
                 2 => :list_of_trains_by_type,
                 3 => :list_of_wagons,
                 0 => :return_from_menu }
    execute_menu(TEXT_MENU, commands)
  end

  def list_of_trains
    station = selection(Station.all, 'station')
    station.each_train { |train| puts "#{train.number} #{train.type} #{train.wagons.length}" }
  end

  def list_of_trains_by_type
    InfoDetailedMenu.new
  end

  def list_of_wagons
    train = selection(Train.all, 'train')
    train.each_wagon do |wagon|
      print_cargo(wagon)
      print_passenger(wagon)
    end
  end

  def print_cargo(wagon)
    return unless wagon.type == :cargo
    puts "#{wagon.number} amount: #{wagon.amount} free amount: #{wagon.free_amount}"
  end

  def print_passenger(wagon)
    return unless wagon.type == :passenger
    puts "#{wagon.number} amount seats: #{wagon.amt_seats} free seats: #{wagon.amt_free_seats}"
  end
end
