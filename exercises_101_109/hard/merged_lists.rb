require 'pry'

def merge(arr1, arr2)
  merged_arr = []
  total_size = arr1.size + arr2.size
  counter1 = 0
  counter2 = 0
  
  merge_arrays(arr1, arr2, counter1, counter2, merged_arr, total_size)

  merged_arr
end

def merge_arrays(arr1, arr2, counter1, counter2, merged_arr, total_size)
  while merged_arr.size < total_size
    if arr2[counter2].nil?
      merged_arr << arr1[counter1]
      counter1 += 1
    elsif arr1[counter1].nil?
      merged_arr << arr2[counter2]
      counter2 += 1
    elsif arr1[counter1] > arr2[counter2]
      merged_arr << arr2[counter2]
      counter2 += 1
    elsif arr1[counter1] < arr2[counter2]
      merged_arr << arr1[counter1]
      counter1 += 1
    else
      merged_arr << arr1[counter1]
      counter1 += 1
    end
  end
end

def merger(arr1, arr2)
  index2 = 0
  result = []

  arr1.each do |value|
    while index2 < arr2.size && arr2[index2] < value
      result << arr2[index2]
      index2 +=1
    end
    result << value
  end
  binding.pry
  result.concat(arr2[index2..-1])
end

p merger([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merger([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merger([], [1, 4, 5])
p merger([1, 4, 5], []) == [1, 4, 5]

p merge([1, 2, 3], [1, 2, 3])
p merger([1, 2, 3], [1, 2, 3])
