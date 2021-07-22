require "test/unit"
require_relative '../code/car'

class CarTest < Test::Unit::TestCase

  def test_attrs
    car = Car.new(2,4,6)
    assert_equal(2, car.id )
    assert_equal(4, car.price_per_day )
    assert_equal(6, car.price_per_km )
  end
end