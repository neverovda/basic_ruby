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

hypotenuse = [a, b, c].max
catenary1, catenary2 = [a, b, c].min(2)

if hypotenuse**2 == catenary1**2 + catenary2**2
  puts "Triagle is rectangular."
else
  puts "Triagle is not rectangular."
end   
