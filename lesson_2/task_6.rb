goods = {}

loop do
  print "Product name: "
  name = gets.chomp.to_s

  break if name == "stop" 

  print "Price: "
  price = gets.chomp.to_f

  print "Amount: "
  amount = gets.chomp.to_f

  goods[name] = {"price" => price, "amount" => amount }

end  

if goods.any? 
  
  total_cost = 0
  
  goods.each { |name , details| 
    cost = details["price"] * details["amount"]
     
    puts "Product name: #{name}"
    puts "Price: #{details["price"]}"
    puts "Amount: #{details["amount"]}"
    puts "Cost: #{cost}"
    puts ""

    total_cost += cost 
  }

  puts "TOTAL COST: #{total_cost}"

end
