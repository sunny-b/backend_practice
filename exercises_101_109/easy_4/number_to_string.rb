DIGITS =  {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
}

def integer_to_string(num)
  return '0' if num == 0
  num_arr = []
  while num > 0
    num_arr << num % 10
    num /= 10
  end
  string_arr = num_arr.map { |num| DIGITS[num] }
  string_arr.reverse.join('')
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'