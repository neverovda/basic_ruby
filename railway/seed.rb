def seed(railway)
    
  railway.stations << Station.new("Ussuriysk")
  railway.stations << Station.new("Vladivostok")
  railway.stations << Station.new("Bolshoy Kamen")
  railway.stations << Station.new("Nakhodka")

  railway.routes << Route.new("Traveling by Primorye", railway.stations.first, railway.stations.last)

  railway.wagons << CargoWagon.new("C-1")
  railway.wagons << CargoWagon.new("C-2")
  railway.wagons << CargoWagon.new("C-3")

  railway.wagons << PassengerWagon.new("P-1")
  railway.wagons << PassengerWagon.new("P-1")
  railway.wagons << PassengerWagon.new("P-1")


  railway.trains << PassengerTrain.new("PT-150")
  railway.trains << PassengerTrain.new("PT-1")
  railway.trains << PassengerTrain.new("PT-200")
  railway.trains << CargoTrain.new("CT-010")
  railway.trains << CargoTrain.new("CT-010")

end
