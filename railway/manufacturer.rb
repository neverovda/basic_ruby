module Manufacturer

  MANUFACTURERS = ["Simens", "Suomen Valtion Rautatiet", "Ussuriyskii LRZ"]
  
  def set_manufacturer(name)
    self.manufacturer = name
  end

  def manufacturer_name
    self.manufacturer
  end

  protected

  attr_accessor :manufacturer

end
