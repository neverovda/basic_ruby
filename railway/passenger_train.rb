class PassengerTrain < Train
  def initialize(name) 
    super(name)
    @type= :passenger
  end
end 
