require "test/unit"
require_relative '../code/calculation'
require_relative '../code/car'
require_relative '../code/rental'

class CalculationTest < Test::Unit::TestCase

  def test_cars
    datas = [{"id"=>1, "price_per_day"=>2000, "price_per_km"=>10}, {"id"=>2, "price_per_day"=>3000, "price_per_km"=>15}, {"id"=>3, "price_per_day"=>1700, "price_per_km"=>8}]

    assert_equal(3, Calculation.cars(datas).count)
    assert_equal(2000, Calculation.cars(datas).first.price_per_day)
  end

  def test_rental
    datas = [{"id"=>1, "car_id"=>1, "start_date"=>"2017-12-8", "end_date"=>"2017-12-10", "distance"=>100}, {"id"=>2, "car_id"=>1, "start_date"=>"2017-12-14", "end_date"=>"2017-12-18", "distance"=>550}, {"id"=>3, "car_id"=>2, "start_date"=>"2017-12-8", "end_date"=>"2017-12-10", "distance"=>150}]

    assert_equal(3, Calculation.rentals(datas).count)
    assert_equal("2017-12-10", Calculation.rentals(datas).last.end_date)
  end

  def test_result
    car_datas = [Car.new(1,2000,10), Car.new(2,3000,15), Car.new(3,1700,8)]
    rent_datas = [Rental.new(1, 1, "2017-12-8", "2017-12-10", 100), Rental.new(2, 1, "2017-12-14", "2017-12-18", 550), Rental.new(3, 2, "2017-12-8", "2017-12-10", 150)]

    assert_equal(5000, Calculation.result(car_datas, rent_datas).first[:price])
  end
end