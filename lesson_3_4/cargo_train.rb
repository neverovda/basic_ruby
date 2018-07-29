class CargoTrain < Train
  
  def add_wagon(wagon)
    if wagon.class == CargoWagon 
      super
    else 
      puts "This wagon is not cargo type"
    end   
  end  

  def type
    "cargo"
  end

end  
