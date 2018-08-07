class PassengerWagon < Wagon
  NUMBER_FORMAT = /^P-\d+/
  def initialize(number, manufacture_name) 
    super(number, manufacture_name)
    @type= :passenger
  end
end
