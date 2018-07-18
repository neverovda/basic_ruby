puts "Введите три коэффициента."

print "a = "
a = gets.chomp.to_f

print "b = "
b = gets.chomp.to_f

print "c = "
c = gets.chomp.to_f

d = b**2 - 4 * a * c

if d < 0
  puts "Решений нет" 
elsif d == 0
  x = -b / (2 * a)
  puts "D = #{d}. x1 = x2 = #{x}"
else
  root_d = Math.sqrt(d)
  x1 = (-b + root_d) / (2 * a)
  x2 = (-b - root_d) / (2 * a)
  puts "D = #{d}. x1 = #{x1}, x2= #{x2}"
end
