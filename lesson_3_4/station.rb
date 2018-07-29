class Station

  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
    puts "Station: #{@name} created"    
  end

  def arrival(train)
    @trains << train
    puts "The train number: #{train.number} came to the station #{@name}."
  end

  def departure(train)
    puts "The train number: #{train.number} departed from station: #{@name}." if @trains.include?(train)
    @trains.delete(train)
  end

  def get_train_list (type = :all)
    puts "Station: #{@name} Train list:"
    puts "Type of trains is #{type}" if type.class == String 
    @trains.select { |train| type == :all || train.type == type } 
  end       

end
