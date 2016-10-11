def halvsies(arr)
  halfway = arr.size / 2 - 1
  halfway = (arr.size / 2.0).round - 1 if arr.size.odd?
  second_half = halfway + 1
  arr1 = arr[0..halfway]
  arr2 = arr[second_half..-1]
  [arr1, arr2]
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]