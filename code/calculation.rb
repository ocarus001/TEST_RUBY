module Calculation
  COMMISSION_PERCENT = 30

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

  def self.result_2(car_datas, rental_datas)

    result = []
    rental_datas.each do |rent|
      cars = car_datas.select {|c| c.id == rent.car_id }

      cars.each do |car|
        days = rent.days.to_i
        price = rent.days * car.price_per_day
        price_per_day = decreases(days, price)
        price_per_km = car.price_per_km * rent.distance

        result << {
          id: rent.id,
          price: price_per_day + price_per_km
        }
      end
    end

    result
  end


  def self.result_3(car_datas, rental_datas)

    result = []
    rental_datas.each do |rent|
      cars = car_datas.select {|c| c.id == rent.car_id }

      cars.each do |car|
        days = rent.days.to_i
        price = rent.days * car.price_per_day
        price_per_day = decreases(days, price)
        price_per_km = car.price_per_km * rent.distance

        price = price_per_day + price_per_km

        commission = percent_of(price, COMMISSION_PERCENT)
        insurance_fee = commission/2
        assistance_fee = 1*days
        drivy_fee = commission - insurance_fee - assistance_fee

        result << {
          id: rent.id,
          price: price,
          commission: {
            insurance_fee: insurance_fee,
            assistance_fee: assistance_fee,
            drivy_fee: drivy_fee
          }
        }
      end
    end

    result
  end

  def self.result_4(car_datas, rental_datas)

    result = []
    rental_datas.each do |rent|
      cars = car_datas.select {|c| c.id == rent.car_id }

      cars.each do |car|
        days = rent.days.to_i
        price = rent.days * car.price_per_day
        price_per_day = decreases(days, price)
        price_per_km = car.price_per_km * rent.distance

        price = price_per_day + price_per_km

        commission = percent_of(price, COMMISSION_PERCENT)
        insurance_fee = commission/2
        assistance_fee = 1*days
        drivy_fee = commission - insurance_fee - assistance_fee
        owner_fee = price - commission

        result << {
          id: rent.id,
          rentals: {
            actions: [
              {
                who: 'driver',
                type: 'debit',
                amount: price
              },
              {
                who: 'owner',
                type: 'credit',
                amount: owner_fee
              },
              {
                who: 'insurance',
                type: 'credit',
                amount: insurance_fee
              },
              {
                who: 'assistance',
                type: 'credit',
                amount: assistance_fee
              },
              {
                who: 'drivy',
                type: 'credit',
                amount: drivy_fee
              }
            ]
          }
        }
      end
    end

    result
  end

  def self.decreases(days, price)
    if days > 1
      price - percent_of(price,10)  
    elsif days > 4
      price - percent_of(price,30)
    elsif days > 10
      price - percent_of(price,50)
    else
      price
    end
  end

  def self.percent_of(total, n)
    total * n / 100
  end

  def self.outpout(file_name, datas)
    File.open(file_name,"w") do |f|
      f.write(JSON.pretty_generate(datas))
    end
  end
end