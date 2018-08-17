class PassengerWagon < Wagon
  extend Accessors
  
  strong_attr_accessor :amt_seats, Integer
  strong_attr_accessor :amt_occupate_seats, Integer


  validate :number, :presence
  validate :number, :format, /^P-\d+/
  validate :manufacturer, :presence
  validate :amt_seats, :presence
  # validate :amt_seats, :type, Integer


  def initialize(number, manufacture_name, amt_seats)
    @type = :passenger
    @amt_seats = amt_seats
    @amt_occupate_seats = 0
    super(number, manufacture_name)
  end

  def occupate_seat
    raise 'The wagon must not move.' if moving?
    raise 'All places are occupied' if @amt_occupate_seats == @amt_seats
    # self.amt_occupate_seats += 1.2
    @amt_occupate_seats += 1
  end

  def amt_free_seats
    @amt_seats - @amt_occupate_seats
  end
  
end
