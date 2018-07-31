class PassengerTrain < Train
  
  def add_wagon(wagon)
    if wagon.class == PassengerWagon 
      super
    else 
      puts "This wagon is not passenger type"
    end   
  end

  def type
    :passenger
  end

end 
