class PassengerWagon < Wagon
  def initialize(name) 
    super(name)
    @type= :passenger
  end
end
