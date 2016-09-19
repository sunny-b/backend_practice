array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array = []
array.each do |num|
  new_array << num + 1
end

p array
p new_array