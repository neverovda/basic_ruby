class ManageStationMenu < BasisMenu
  TEXT_MENU = ['1. Rename and add description',
               '2. History of names and description',
               '0. Return'].freeze

  def initialize
    @station = selection(Station.all, 'station')
    start if @station
  end

  def start
    commands = { 1 => :rename,
                 2 => :info,
                 0 => :return_from_menu }
    execute_menu(TEXT_MENU, commands)
  end

  def rename
    puts "Enter name"
    @station.name = gets.chomp.to_s
    puts "Enter description"
    @station.description = gets.chomp.to_s
  end

  def info
    puts "History of name"
    @station.name_history.each {|name| p name}
    puts "History of description"
    @station.description_history.each {|descrip| p descrip}
  end  
      
end
