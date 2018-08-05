class CargoWagon < Wagon
  def initialize(number, manufacture_name)  
    super(number, manufacture_name)
    @type = :cargo
  end  
end 
