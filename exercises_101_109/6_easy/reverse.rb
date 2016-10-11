def reverse!(arr)
  iterations = arr.size / 2
  counter = 0
  while counter <= iterations
    arr[counter], arr[(counter * -1) - 1] =
    arr[(counter * -1) - 1], arr[counter]
    counter += 1
  end
  arr
end

puts list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
puts list
puts list.object_id == result.object_id

list = %w(a b c d e)
puts reverse!(list) # => ["e", "d", "c", "b", "a"]
puts list == ["e", "d", "c", "b", "a"]

list = ['abc']
puts reverse!(list) # => ["abc"]
puts list == ["abc"]

list = []
puts reverse!([]) # => []
puts list == []
