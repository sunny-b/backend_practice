require 'pry'

def multiply_list(arr1, arr2)
  product_arr = []
  arr1.zip(arr2).each { |arr| product_arr << arr.reduce(:*) }
  product_arr
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]