def seed

  Station.new("Ussuriysk")
  Station.new("Vladivostok")
  Station.new("Bolshoy Kamen")
  Station.new("Nakhodka")

  Route.new("Traveling by Primorye", Station.all.first, Station.all.last)

  CargoWagon.new("C-1", Manufacturer::MANUFACTURERS[2])
  CargoWagon.new("C-2", Manufacturer::MANUFACTURERS[2])
  CargoWagon.new("C-3", Manufacturer::MANUFACTURERS[0])

  PassengerWagon.new("P-1", Manufacturer::MANUFACTURERS[2])
  PassengerWagon.new("P-2", Manufacturer::MANUFACTURERS[2])
  PassengerWagon.new("P-3", Manufacturer::MANUFACTURERS[1])


  PassengerTrain.new("PT-150", Manufacturer::MANUFACTURERS[2])
  PassengerTrain.new("PT-1", Manufacturer::MANUFACTURERS[2])
  PassengerTrain.new("PT-200", Manufacturer::MANUFACTURERS[0])
  
  CargoTrain.new("CT-010", Manufacturer::MANUFACTURERS[2])
  CargoTrain.new("CT-210", Manufacturer::MANUFACTURERS[1])

end
