module Calculation
  # COMMISSION_PERCENT = 30

  def self.cars(datas)
    cars = []
    datas.each do |car|
      cars << Car.new(car['id'], car['price_per_day'], car['price_per_km'])
    end

    cars
  end

  def self.rentals(datas)
    rentals = []
    datas.each do |rent|
      rentals << Rental.new(rent['id'], rent['car_id'], rent['start_date'], rent['end_date'], rent['distance'])
    end

    rentals
  end

  def self.result(car_datas, rental_datas)

    result = []
    rental_datas.each do |rent|
      cars = car_datas.select {|c| c.id == rent.car_id }

      cars.each do |car|
        price_per_day = rent.days * car.price_per_day
        price_per_km = car.price_per_km * rent.distance

        result << {
          id: rent.id,
          price: price_per_day + price_per_km
        }
      end
    end

    result
  end

  def self.outpout(file_name, datas)
    File.open(file_name,"w") do |f|
      f.write(JSON.pretty_generate(datas))
    end
  end
end