require 'pry'

DIGITS = {
  '-' => -1 , '+' => 1, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0
}

def string_to_signed_integer(str)
  numbers = str.chars.map { |char| DIGITS[char] }
  
  if str[0] == '-' || str[0] == '+'
    sign = numbers.shift
  else
    sign = 1
  end

  value = 0
  numbers.map { |num| value = 10 * value + num}
  sign * value
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100

def string_to_signed_integer(string)
  range = string([1..-1])
  call = string_to_integer(range)

  case string[0]
  when '-' then -call
  when '+' then call
  else          string_to_integer(string)
  end
end
