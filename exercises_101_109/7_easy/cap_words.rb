require 'pry'

ALPHABET = ('a'..'z').zip('A'..'Z').to_h

def word_cap(str)
  str = str.split
  str = str.map do |word|
    word.chars.each_with_index do |char, index|
      if index == 0 && !!ALPHABET[char]
        char.replace ALPHABET[char]  
      elsif index > 0 && !!ALPHABET.key(char)
        char.replace ALPHABET.key(char)
      end
   end.join('')
  end
  str.join(' ')
end

puts word_cap('four score and seven')
puts word_cap('the javaScript language')
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'