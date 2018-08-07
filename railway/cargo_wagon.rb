class CargoWagon < Wagon
  NUMBER_FORMAT = /^C-\d+/
  def initialize(number, manufacture_name)  
    super(number, manufacture_name)
    @type = :cargo
  end  
end 
