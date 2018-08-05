module InstanceCounter
  
  module ClassMethods
    
    attr_accessor :instance_counter

    def instances
      @instance_counter ||= 0
      @instance_counter
    end

  end
  
  module InstanceMethods
    
    protected
   
    def register_instance
      self.class.instance_counter ||= 0
      self.class.instance_counter += 1  
    end 
  end
  
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end
