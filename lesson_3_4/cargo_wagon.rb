class CargoWagon < Wagon
  def initialize(name)  
    super(name)
    @type = :cargo
  end  
end 
