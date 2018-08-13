class ManageWagonMenu < BasisMenu
  TEXT_MENU = ['1. Add passenger',
               '2. Add cargo',
               '0. Return'].freeze

  def initialize
    @wagon = selection(Wagon.all, 'wagon')
    start if @wagon
  end

  def start
    commands = { 1 => :add_passenger,
                 2 => :add_cargo,
                 0 => :return_from_menu }
    execute_menu(TEXT_MENU, commands)
  end

  def add_passenger(_wagon)
    if @wagon.type != :passenger
      puts 'This is not a passenger wagon'
      return
    end
    @wagon.occupate_seat
    puts 'The passenger entered in the wagon'
  end

  def add_cargo(_wagon)
    if @wagon.type != :cargo
      puts 'This is not a cargo wagon'
      return
    end
    puts 'Enter amount of cargo'
    @wagon.fill(gets.chomp.to_f)
    puts 'Cargo added'
  end
end
