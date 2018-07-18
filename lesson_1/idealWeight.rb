puts "What is your name?"
name = gets.chomp.downcase.capitalize

puts "What is your height?"
height = gets.chomp.to_i

weight = height - 110

if weight > 0  
	puts "#{name}, your ideal weight is #{weight}"
else
	puts "Your weight is optimal"
end	 	 