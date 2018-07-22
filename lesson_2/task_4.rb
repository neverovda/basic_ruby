vowels = ['a', 'e', 'i', 'o', 'u', 'y']
vowels_hash = {}

num = 1
('a'..'z').each do |letter|
  vowels_hash[letter] = num if vowels.include?(letter)
  num += 1
end

puts vowels_hash  
