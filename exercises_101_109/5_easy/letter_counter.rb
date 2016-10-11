require 'pry'

def word_sizes(str)
  sizes = Hash.new(0)
  str.split(' ').map do |word|
    word = word.downcase.delete("^a-z")
    sizes[word.length] += 1
  end
  sizes
end

puts word_sizes('Four score and seven.')
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}

