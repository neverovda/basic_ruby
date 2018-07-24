class Station

  def initialize(name)
    @name = name
    @trains = []    
  end

  def arrival(train)
    @trains << train
    # puts "Train #{train.name} arrived."
    puts "Train #{train} arrived."
  end

  def departure(train)
    # puts "Train #{train.name} departed." if @trains.include?(train)
    puts "Train #{train} departed." if @trains.include?(train)
    @trains.delete(train)
  end

  def get_train_list
    puts "Train list:"
    @trains.each { |train| puts train }
  end   

  # def get_train_list_by_type
  #   puts "Train list:"
  #   @trains.each { |train| puts train }
  # end

end
