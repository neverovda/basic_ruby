module Validation

  def valid?
    validate!
  rescue
    false
  end  
  
  protected

  def validate!
    validate_number if self.instance_variables.include?(:@number)
    validate_manufacturer if self.instance_variables.include?(:@manufacturer)
    validate_name if self.instance_variables.include?(:@name)
    true 
  end

  def validate_number 
    raise "Number can't be nil" if number.nil?
    raise "Number has invalid format" if number !~ self.class::NUMBER_FORMAT
  end

  def validate_manufacturer
    raise "Name manufacturer's can't be nil" if manufacturer.nil?
    if manufacturer.length < Manufacturer::MIN_NAME_MANUFACTURERS 
      raise "Name manufacturer's should be at least #{Manufacturer::MIN_NAME_MANUFACTURERS} sybbols"    
    end  
  end

  def validate_name
    raise "Name can't be nil" if name.nil?
    if name.length < self.class::MIN_NAME_LENGHT
      raise "Name should be at least #{self.class::MIN_NAME_LENGHT} sybbols"
    end     
  end   

end
