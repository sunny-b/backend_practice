def running_total(array)
  running_total_arr = []
  array.each_with_index do |num, index|
    running_total_arr << num + running_total_arr.fetch(index-1, 0)
  end
  running_total_arr
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

def running_total2(array)
  arr2 = []
  array.reduce { |sum, num| arr2 << sum + num }
end

p running_total([2, 5, 13])
