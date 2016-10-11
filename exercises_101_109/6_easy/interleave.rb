def interweave(arr1, arr2)
  new_arr = []
  counter = 0
  while counter < arr1.size
    new_arr << arr1[counter]
    new_arr << arr2[counter]
    counter += 1
  end
  new_arr
end

puts interleave([1, 2, 3], ['a', 'b', 'c'])