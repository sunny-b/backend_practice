def repeater(string)
  double_string = []
  string.chars.map { |char| double_string << (char + char) }
  double_string.join('')
end

def repeater2(str)
  counter = 0
  value = str.length * 2
  while counter < value
    str.insert(counter, str[counter])
    counter += 2
  end
  str
end

puts repeater2('Hello') == "HHeelllloo"
puts repeater2("Good job!") == "GGoooodd  jjoobb!!"
puts repeater2('') == ''