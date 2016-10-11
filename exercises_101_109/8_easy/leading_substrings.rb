def substrings_at_start(str)
  str_arr = []
  counter = 1
  while counter <= str.length
    str_arr << str.slice(0, counter)
    counter += 1
  end
  str_arr
end

puts substrings_at_start('abc') == ['a', 'ab', 'abc']
puts substrings_at_start('a') == ['a']
puts substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

