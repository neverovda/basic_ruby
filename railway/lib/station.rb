class Station
  include InstanceCounter
  include Validation

  attr_reader :name

  MIN_NAME_LENGHT = 6

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
    validate!
    @trains = []
    @@stations << self
    register_instance
  end

  def arrival(train)
    @trains << train
  end

  def departure(train)
    @trains.delete(train)
  end

  def get_train_list(type)
    puts "Station: #{@name} Train list:"
    return @trains if type == :all
    puts "Type of trains is #{type}"
    @trains.select { |train| train.type == type }
  end

  def each_train
    @trains.each { |train| yield(train) }
  end

  protected

  def validate!
    raise "Name can't be nil." if name.nil?
    raise "Name should be at least #{MIN_NAME_LENGHT} symbols" if name.length < MIN_NAME_LENGHT
    true
  end
end
