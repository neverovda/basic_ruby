class Route
  include InstanceCounter
  include Validation

  attr_reader :stations, :name

  validate :name, :presence

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
    validate_stations!
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

  def route_list
    puts "Route #{@name} list:"
    @stations.each { |station| puts station.name }
  end

   def valid?
    validate_stations!
    super
  end

  protected

  def validate_stations!
    raise 'On the route, not only stations.' unless correspond_to_class?
    true
  end

  def correspond_to_class?
    @stations.all? { |station| station.is_a? Station }
  end
end
