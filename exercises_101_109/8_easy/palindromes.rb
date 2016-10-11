def substrings_at_start(str, start)
  str_arr = []
  counter = 1
  while counter <= str.length - start
    str_arr << str.slice(start, counter)
    counter += 1
  end
  str_arr
end

def substrings(str)
  sub_arr = []
  str.length.times do |num|
    sub_arr << substrings_at_start(str, num)
  end
  sub_arr.flatten
end

def palindromes(str)
  all_substrings = substrings(str)
  all_substrings.select { |str| str.downcase == str.downcase.reverse && str.length > 1 && !str.include?('-')}
end

puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye')
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]