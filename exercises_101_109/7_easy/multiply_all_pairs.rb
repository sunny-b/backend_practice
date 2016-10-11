def multiply_all_pairs(arr1, arr2)
  new_arr = []
  arr1.each do |value1|
    arr2.each do |value2|
      new_arr << value1 * value2
    end
  end
  new_arr.sort
end 

puts multiply_all_pairs([2, 4], [4, 3, 1, 2])