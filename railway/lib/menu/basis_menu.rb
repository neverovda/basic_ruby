class BasisMenu
  def execute_menu(list, commans)
    loop do
      prin_menu(list)
      commans.default = 'incorrect_value'
      result = attempt_execute_commands(commans)
      break if %i[exit return].include? result
    end
  end

  def prin_menu(list)
    puts '<<< Enter the number of the item >>>'
    list.each { |str| puts str }
  end

  def exit
    puts 'Goodbay!'
    :exit
  end

  def return_from_menu
    :return
  end

  def incorrect_value
    puts 'The menu item is not correctly selected. Try again'
  end

  def attempt_execute_commands(commans)
    send commans[selection_number]
  rescue RuntimeError => e
    puts e.message
    puts 'Try again'
  end

  # rename del get
  def selection_number
    gets.chomp.to_i
  end

  def enter_name
    puts 'Enter name'
    gets.chomp
  end

  def enter_number
    puts 'Enter number'
    gets.chomp
  end

  def choose_type
    puts 'Choose the type'
    puts '1. Cargo'
    puts '2. Passenger'
    number = selection_number
    return :cargo if number == 1
    return :passenger if number == 2
  end

  def selection(arr, text)
    puts '<<< Enter the number of the item >>>'
    puts "Choose #{text}"

    i = 1
    arr.each do |item|
      puts "#{i}. #{type_of_info(item)}"
      i += 1
    end

    puts 'The list of objects is empty. Create objects' if arr.empty?

    arr[selection_number - 1]
  end

  def type_of_info(obj)
    return obj.name if obj.instance_variables.include?(:@name)
    return obj.number if obj.instance_variables.include?(:@number)
    obj
  end
end
