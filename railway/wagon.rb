class Wagon

  include Manufacturer
  include InstanceCounter

  attr_reader :number, :type

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
