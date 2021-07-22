require 'json'
require_relative 'code/car'
require_relative 'code/rental'
require_relative 'code/calculation'

datas = JSON.parse(File.read('data/input.json'))
car_datas = datas['cars']
rental_datas = datas['rentals']

cars = Calculation.cars(car_datas)
rentals = Calculation.rentals(rental_datas)

Calculation.outpout('data/outpout_1.json', Calculation.result(cars, rentals))
Calculation.outpout('data/outpout_2.json', Calculation.result_2(cars, rentals))
Calculation.outpout('data/outpout_3.json', Calculation.result_3(cars, rentals))
Calculation.outpout('data/outpout_4.json', Calculation.result_4(cars, rentals))

