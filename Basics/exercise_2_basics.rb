def number_spliter (number)
  thousands_place = number/1000
  hundreds_place = (number%1000)/100
  tens_place = (number%100)/10
  ones_place = number%10

  puts "#{number} has #{thousands_place} in the thousands place."
  puts "#{hundreds_place} in the hundreds place."
  puts "#{tens_place} in the tens place"
  puts "and #{ones_place} in the ones place"
end

number_spliter(4567)