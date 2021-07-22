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

