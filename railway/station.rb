class Station

  include InstaneCounter

  attr_reader :name

  @@stations = []

  class << self
    
    def all
      @@stations
    end
    
    def enough_stations?
    @@stations.length > 1
    end

  end  

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    puts "Station: #{@name} created"
    register_instance    
  end

  def arrival(train)
    @trains << train
    puts "The train number: #{train.number} came to the station #{@name}."
  end

  def departure(train)
    puts "The train number: #{train.number} departed from station: #{@name}." if @trains.include?(train)
    @trains.delete(train)
  end

  def get_train_list (type)
    type_string = "passenger" if type == :passenger
    type_string = "cargo" if type == :cargo
    puts "Station: #{@name} Train list:"
    puts "Type of trains is #{type_string}" if type != :all 
    @trains.select { |train| type == :all || train.type == type } 
  end       

end
