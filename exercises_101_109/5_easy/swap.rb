def swap2(string)
  new_string_arr = string.split(' ').map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end
  new_string_arr.join(' ')
end

def swap_first_last_characters(a, b)
  a, b = b, a
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word[0], word[-1])
    word
  end
  result.join(' ')
end

puts swap('Oh what a wonderful day it is')
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'

