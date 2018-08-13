class PassengerWagon < Wagon
  attr_reader :amt_seats, :amt_occupate_seats
  NUMBER_FORMAT = /^P-\d+/

  def initialize(number, manufacture_name, amt_seats)
    @type = :passenger
    @amt_seats = amt_seats
    @amt_occupate_seats = 0
    super(number, manufacture_name)
  end

  def occupate_seat
    raise 'The wagon must not move.' if moving?
    raise 'All places are occupied' if @amt_occupate_seats == @amt_seats
    @amt_occupate_seats += 1
  end

  def amt_free_seats
    @amt_seats - @amt_occupate_seats
  end

  protected

  def validate!
    raise "Amount seats can't be nil." if amt_seats.nil?
    raise 'Amount seats can be integer number.' unless amt_seats.is_a? Integer
    super
  end
end
