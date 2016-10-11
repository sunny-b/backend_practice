require 'pry'

def center_of(str)
  middle_str = ''
  middle = str.length / 2
  middle_str << str[middle - 1] if str.length.even?
  middle_str << str[middle]
  middle_str
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
