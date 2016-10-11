def oddities(array)
  odd_index = []
  array.each_with_index { |value, index| odd_index << value if index.even? }
  odd_index
end

def even_items(array)
  even_index = []
  array.each_with_index { |num, index| even_index << num if index.odd? }
  even_index
end

def even_times2(array)
  even_index = []
  index  = 1
  while index < array.size
    even_index << array[index]
    index += 2
  end
  even_index
end

puts even_items([2, 3, 4, 5, 6])
puts even_items(['abc', 'def'])
puts even_items([123])
puts even_items([])

puts even_times2([2, 3, 4, 5, 6])
puts even_times2(['abc', 'def'])
puts even_times2([123])
puts even_times2([])
