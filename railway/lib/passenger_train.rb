class PassengerTrain < Train
  include Validation

  validate :number, :presence
  validate :number, :format, /^[a-z0-9]{3}-{0,1}[a-z0-9]{2}$/i
  validate :manufacturer, :presence
  validate :wagons, :each_type, PassengerWagon

  def initialize(number, manufacture_name)
    super(number, manufacture_name)
    @type = :passenger
  end
end
