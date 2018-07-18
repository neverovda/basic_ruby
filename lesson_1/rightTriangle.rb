def pythagoras_testing (hypotenuse, catenary1, catenary2)
	if hypotenuse ** 2 == catenary1 ** 2 + catenary2 ** 2
		puts "Triagle is rectangular."
	else
		puts "Triagle is not rectangular."
	end 		
end		

puts "Enter the sides of triagle"

print "a = "
a = gets.chomp.to_f

print "b = "
b = gets.chomp.to_f

print "c = "
c = gets.chomp.to_f

if a == b && b == c 
	puts "Equilateral triangle."
elsif a == b || b == c || c == a
	puts "Isiscedles triagle."
end	

if a > b && a > c
	pythagoras_testing(a, b, c)
elsif b > a && b > c
	pythagoras_testing(b, a, c)
elsif c > a && c > b
	pythagoras_testing(c, a, b)
end				