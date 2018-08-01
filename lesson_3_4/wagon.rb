class Wagon

  attr_reader :name, :type
  
  def initialize(name)
    @name = name
    @free = true    
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
