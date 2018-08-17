class MainMenu < BasisMenu
  TEXT_MENU = ['1. Create an object (station, route, train, wagon)',
               '2. Manage a route',
               '3. Manage a train',
               '4. Manage a wagon',
               '5. Manage a station',
               '6. Information',
               '0. Exit'].freeze

  def initialize
    commands = { 1 => :create_objects,
                 2 => :manage_route,
                 3 => :manage_train,
                 4 => :manage_wagon,
                 5 => :manage_station,
                 6 => :info,
                 0 => :exit }

    execute_menu(TEXT_MENU, commands)
  end

  def create_objects
    CreatingMenu.new
  end

  def manage_route
    ManageRouteMenu.new
  end

  def manage_train
    ManageTrainMenu.new
  end

  def manage_wagon
    ManageWagonMenu.new
  end

  def manage_station
    ManageStationMenu.new
  end

  def info
    InfoMenu.new
  end
end
