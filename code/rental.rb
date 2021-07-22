require 'time'

class Rental
  attr_accessor :id, :car_id, :start_date, :end_date, :distance

  def initialize(id, car_id, start_date, end_date, distance)
    @id = id
    @car_id  = car_id
    @start_date = start_date
    @end_date = end_date
    @distance = distance
  end

  def days
    (Date.parse(end_date) - Date.parse(start_date)).to_i
  end

end