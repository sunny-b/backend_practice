DIGITS =  {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
}

def signed_integer_to_string(num)
  return '0' if num == 0
  num_arr = []
  negative = true if num < 0
  num *= -1 if negative

  while num != 0
    num_arr << num % 10
    num /= 10
  end

  string_arr = num_arr.map { |num| DIGITS[num] }
  string = string_arr.reverse.join('')
  sign = negative ? '-' : '+'
  string.prepend(sign)
end

puts signed_integer_to_string(4321)
puts signed_integer_to_string(-123)
puts signed_integer_to_string(0)