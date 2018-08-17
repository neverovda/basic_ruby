class Station
  include InstanceCounter
  include Validation
  extend Accessors

  attr_accessor_with_history :name, :description
  validate :name, :presence
  
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
    self.name = name
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

end
