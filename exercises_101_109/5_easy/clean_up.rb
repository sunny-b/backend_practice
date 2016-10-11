require 'pry'

ALPHA = ('a'..'z').to_a

def cleanup(str)
  empty_sentence = "---what's my +*& line?".gsub(/[~`<>,.;:"|}{!@#$%^&*()_+-='?]/, " ")
  empty_sentence.gsub(/\s+/, ' ')
end

puts cleanup("---what's my +*& line?") == ' what s my line '

def another_cleanup(str)
  str = str.chars.map do |char|
    if ALPHA.include? char
      char
    else
      char.replace ' '
      char
    end
  end.join('')
  str.squeeze(' ')
end

puts another_cleanup("---what's my +*& line?") == ' what s my line '