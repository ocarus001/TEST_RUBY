require "test/unit"
require_relative '../code/rental'

class RentalTest < Test::Unit::TestCase

  def test_attrs
    rental = Rental.new(2,4,"2017-12-8","2017-12-9",10)
    assert_equal(2, rental.id )
    assert_equal(4, rental.car_id )
    assert_equal("2017-12-8", rental.start_date )
  end

  def test_days
    rental = Rental.new(2,4,"2017-12-8","2017-12-9",10)
    assert_equal(1, rental.days)
  end
end