def double_consonants(string)
  double_string = ''
  string.chars.map do |char|
    if char.downcase.match(/[qwrtypsdfghjklzxcvbnm]/)
      double_string << char + char
    else
      double_string << char
    end
  end
  double_string
end

puts double_consonants('String')
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""