def average(numbers)
  total_amount = numbers.reduce(:+)

  format('%.2f', total_amount / numbers.size.to_f)
end

puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])
