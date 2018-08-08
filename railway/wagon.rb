class Wagon

  include Manufacturer
  include InstanceCounter
  include Validation

  attr_reader :number, :type

  NUMBER_FORMAT = /^(C|P)-\d+/

  @@wagons = []

  class << self
    def all
      @@wagons
    end    
  end  
  
  def initialize(number, manufacture_name)
    @number = number
    @free = true
    set_manufacturer(manufacture_name)
    validate!
    @@wagons << self
    register_instance   
  end

  def use!
    @free = false 
  end

  def set_free
    @free = true 
  end

  def free?
    @free
  end

  protected

   def validate!
    raise "Number can't be nil." if number.nil?
    raise "Number has invalid format." if number !~ NUMBER_FORMAT
    raise "Name manufacturer's can't be nil." if manufacturer.nil?
    if manufacturer.length < Manufacturer::MIN_NAME_MANUFACTURERS 
      raise "Name manufacturer's should be at least #{Manufacturer::MIN_NAME_MANUFACTURERS} symbols."    
    end
    true 
  end

end  
