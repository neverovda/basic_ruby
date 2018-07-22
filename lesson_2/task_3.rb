fnumbers = [0, 1]

loop do
  number = fnumbers[-1] + fnumbers[-2] 
  break if number > 100 
  fnumbers << number  
end  

puts fnumbers
