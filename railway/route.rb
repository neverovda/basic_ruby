class Route
  include InstanceCounter
  include Validation

  attr_reader :stations, :name

  MIN_NAME_LENGHT = 10

  @@routes = []

  class << self
    def all
      @@routes
    end
  end

  def initialize(name, f_station, l_station)
    @name = name
    @stations = [f_station, l_station]
    validate!
    @@routes << self
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station)
    station
  end

  def delete_station(station)
    @stations.delete(station) unless [@stations.first, @stations.last].include? station
  end

  def intermediate_stations
    amt = @stations.length - 2
    @stations.slice(1, amt) || []
  end

  def get_route_list
    puts "Route #{@name} list:"
    @stations.each { |station| puts station.name }
  end

  protected

  def validate!
    raise "Name can't be nil." if name.nil?
    raise "Name should be at least #{MIN_NAME_LENGHT} symbols." if name.length < MIN_NAME_LENGHT
    raise 'On the route, not only stations.' unless correspond_to_class?
    true
  end

  def correspond_to_class?
    @stations.all? { |station| station.is_a? Station }
  end
end
