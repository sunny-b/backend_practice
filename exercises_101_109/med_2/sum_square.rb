def sum_square_difference(num)
  num_arr = (1..num).to_a
  square_sum = num_arr.reduce(:+)**2
  sum_square = num_arr.map{ |num| num**2 }.reduce(:+)

  square_sum - sum_square
end

puts sum_square_difference(3) == 22
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150
