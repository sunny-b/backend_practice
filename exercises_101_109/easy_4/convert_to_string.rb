require 'pry'

DIGITS = {
  '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0
}

def string_to_integer(str)
  numbers = str.chars.map { |char| DIGITS[char] }

  value = 0
  numbers.map { |num| value = 10 * value + num}
  value
end

puts string_to_integer('500')

HEXA = {
  '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'a' => 10, 'b' => 11,
  'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15
}

def hexadecimal_to_integer(hexadecimal)
  digits = hexadecimal.downcase.chars.map { |char| HEXA[char] }
  index = -1
  power = 0
  value = 0
  while index.abs <= digits.length
    value += digits[index] * (16**power)
    power += 1
    index -= 1
  end
  value
end 

puts hexadecimal_to_integer('4D9F')