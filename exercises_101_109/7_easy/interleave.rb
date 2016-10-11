def interweave(arr1, arr2)
  new_arr = arr1.zip(arr2).flatten
end

puts interweave([1, 2, 3], ['a', 'b', 'c']).inspect