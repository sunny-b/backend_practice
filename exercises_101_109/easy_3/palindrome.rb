def palindrome?(str)
  str.reverse == str
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true

def array_palindrome?(array)
  array.reverse == array
end

puts array_palindrome?([1,2,3,4,5,5,4,3,2,1])

def all_palindrome?(array_or_string)
  array_or_string == array_or_string.reverse
end
