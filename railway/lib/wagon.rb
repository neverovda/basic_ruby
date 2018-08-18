class Wagon
  include Manufacturer
  include InstanceCounter
  include Validation

  attr_reader :number, :type, :current_train

  validate :number, :presence
  validate :number, :format, /^(C|P)-\d+/
  validate :manufacturer, :presence

  @@wagons = []

  class << self
    def all
      @@wagons
    end
  end

  def initialize(number, manufacture_name)
    @number = number
    @manufacturer = manufacture_name
    validate!
    @@wagons << self
    register_instance
  end

  def use!(train)
    @current_train = train
  end

  def set_free
    @current_train = nil
  end

  def free?
    !current_train
  end

  def moving?
    return false if free?
    @current_train.speed != 0
  end
end
