class CargoWagon < Wagon
  attr_reader :amount, :occupate_amt

  validate :number, :presence
  validate :number, :format, /^C-\d+/
  validate :manufacturer, :presence
  validate :amount, :presence
  validate :amount, :type, Numeric

  def initialize(number, manufacture_name, amount)
    @type = :cargo
    @amount = amount
    @occupate_amt = 0
    super(number, manufacture_name)
  end

  def fill(amt_cargo)
    raise 'The wagon must not move.' if moving?
    raise 'Cargo can be number.' unless amt_cargo.is_a? Numeric
    raise 'There is no space for cargo' if @occupate_amt + amt_cargo > @amount
    @occupate_amt += amt_cargo
  end

  def free_amount
    @amount - @occupate_amt
  end
end
