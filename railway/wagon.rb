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

end  
