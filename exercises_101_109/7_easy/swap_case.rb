ALPHABET = ('a'..'z').zip('A'..'Z').to_h

def swapcase(str)
  str.chars.each do |char|
    if !!ALPHABET[char]
      char.replace ALPHABET[char]  
    elsif !!ALPHABET.key(char)
      char.replace ALPHABET.key(char)
    end
  end.join('')
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'