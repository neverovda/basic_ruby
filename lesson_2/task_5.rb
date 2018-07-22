print "Year: "
year = gets.chomp.to_i

print "Month: "
index_full_month = gets.chomp.to_i - 2

print "Day: "
amount_d = gets.chomp.to_i

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 
  months[1] = 29
end  

if index_full_month >= 0 
  months.slice(0..index_full_month).each { |month| amount_d += month }
end

puts amount_d
