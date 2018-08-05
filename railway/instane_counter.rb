module InstaneCounter
  
  module ClassMethods
    
    attr_accessor :instane_counter

    def instances
      @instane_counter ||= 0
      @instane_counter
    end

  end
  
  module InstanceMethods
    
    protected
   
    def register_instance
      self.class.instane_counter ||= 0
      self.class.instane_counter += 1  
    end 
  end
  
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end
