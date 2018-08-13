class ManageRouteMenu < BasisMenu
  TEXT_MENU = ['1. Add a station',
               '2. Delete a station',
               '0. Return'].freeze

  def initialize
    @rout = selection(Route.all, 'route')
    start if @rout
  end

  def start
    commands = { 1 => :add_station,
                 2 => :delete_station,
                 0 => :return_from_menu }
    execute_menu(TEXT_MENU, commands)
  end

  def add_station
    station = @rout.add_station(selection(Station.all, 'station'))
    puts "#{station.name} added to route #{@name}."
  end

  def delete_station
    station = @rout.delete_station(selection(rout.intermediate_stations, 'station'))
    puts "#{station.name} deleted." if station
  end
end
