module Manufacturer

  MANUFACTURERS = ["Simens", "Suomen Valtion Rautatiet", "Ussuriyskii LRZ"]
  MIN_NAME_MANUFACTURERS = 3

  def set_manufacturer(name)
    self.manufacturer = name
  end

  def manufacturer_name
    self.manufacturer
  end

  protected

  attr_accessor :manufacturer

end
