class Wagon
  
  def initialize
    @free = true    
  end

  def use
    @free = false 
  end

  def set_free
    @free = true 
  end

  def free?
    @used
  end   

end  
