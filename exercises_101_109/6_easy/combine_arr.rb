def merge(arr1, arr2)
  combined = arr1 + arr2
  combined.sort!.uniq!
end

def merge2(arr1, arr2)
  arr1 | arr2
end

puts merge2([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]