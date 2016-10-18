require 'pry'

def merge(arr1, arr2)
  index2 = 0
  result = []

  arr1.each do |value|
    while index2 < arr2.size && arr2[index2] < value
      result << arr2[index2]
      index2 += 1
    end
    result << value
  end
  
  result.concat(arr2[index2..-1])
end

def merge_sort(array)
  return array if array.size == 1

  sub_array_1 = array[0...array.size / 2]
  sub_array_2 = array[array.size / 2...array.size]

  sub_array_1 = merge_sort(sub_array_1)
  sub_array_2 = merge_sort(sub_array_2)

  merge(sub_array_1, sub_array_2)
end

def merge_sort1(array)
  results = []
  singles = []
  array.map { |num| singles << [num] }

  until (results.size <= 1 && singles.size <= 1)
    results << merge(singles.shift, singles.shift) while singles.size > 1
    singles << merge(results.shift, results.shift) while results.size > 1
  end

  singles.empty? ? results[0] : singles [0]
end

p merge_sort1([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort1([5, 3]) == [3, 5]
p merge_sort1([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort1(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort1([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]