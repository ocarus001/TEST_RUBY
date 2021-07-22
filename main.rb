require 'json'
require_relative 'code/car'
require_relative 'code/rental'
require_relative 'code/calculation'

datas = JSON.parse(File.read('data/input.json'))
car_datas = datas['cars']
rental_datas = datas['rentals']

cars = Calculation.cars(car_datas)
rentals = Calculation.rentals(rental_datas)
result = Calculation.result(cars, rentals)

File.open("data/outpout.json","w") do |f|
  f.write(JSON.pretty_generate(result))
end