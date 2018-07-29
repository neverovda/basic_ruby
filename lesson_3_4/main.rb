require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'

station_1 = Station.new("Ussuriysk")
station_2 = Station.new("Vladivostok")
station_3 = Station.new("Bolshoy Kamen")
station_4 = Station.new("Nakhodka")

route_1 = Route.new("Traveling by Primorye", station_1, station_4)

route_1.add_station(station_2)
route_1.add_station(station_3)
route_1.get_route_list

route_1.delete_station(station_3)
route_1.delete_station(station_3)
route_1.get_route_list

train1 = PassengerTrain.new("Y-150", 10)

train1.add_wagon
train1.length
train1.remove_wagon
train1.length
train1.speed = 50
train1.speed
train1.add_wagon
train1.length
train1.remove_wagon
train1.length

train1.stop
train1.set_route(route_1)
station_1.get_train_list

train1.messege_for_passegers
train1.go_forth
train1.messege_for_passegers
train1.go_forth
train1.go_forth
train1.go_forth
train1.messege_for_passegers

train1.go_back
train1.go_back
train1.go_back

train2 = PassengerTrain.new("S-1", 10)
train2.set_route(route_1)

train3 = PassengerTrain.new("Y-200", 10)
train3.set_route(route_1)

train4 = CargoTrain.new("G-010", 10)
train4.set_route(route_1)

train5 = CargoTrain.new("G-010", 10)
train5.set_route(route_1)

puts station_1.get_train_list("passenger")
puts station_1.get_train_list("cargo")
puts station_1.get_train_list()
