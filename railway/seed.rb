def seed
  Station.new('Ussuriysk')
  vlad = Station.new('Vladivostok')
  bk = Station.new('Bolshoy Kamen')
  Station.new('Nakhodka')

  route = Route.new('Traveling by Primorye', Station.all.first, Station.all.last)
  route.add_station(vlad)
  route.add_station(bk)

  p1 = PassengerWagon.new('P-1', Manufacturer::MANUFACTURERS[2], 50)
  p2 = PassengerWagon.new('P-2', Manufacturer::MANUFACTURERS[2], 40)
  p3 = PassengerWagon.new('P-3', Manufacturer::MANUFACTURERS[1], 20)

  pt1 = PassengerTrain.new('PT2-15', Manufacturer::MANUFACTURERS[2])
  pt2 = PassengerTrain.new('PT2-10', Manufacturer::MANUFACTURERS[2])
  pt3 = PassengerTrain.new('PT2-20', Manufacturer::MANUFACTURERS[0])

  pt1.add_wagon(p1)
  pt2.add_wagon(p2)
  pt3.add_wagon(p3)

  c1 = CargoWagon.new('C-1', Manufacturer::MANUFACTURERS[2], 100)
  c2 = CargoWagon.new('C-2', Manufacturer::MANUFACTURERS[2], 100)
  c3 = CargoWagon.new('C-3', Manufacturer::MANUFACTURERS[0], 80)

  ct1 = CargoTrain.new('CT8-01', Manufacturer::MANUFACTURERS[2])
  ct2 = CargoTrain.new('CT3-21', Manufacturer::MANUFACTURERS[1])

  ct1.add_wagon(c1)
  ct1.add_wagon(c2)
  ct2.add_wagon(c3)

  Train.all.each { |train| train.route = route }
end
