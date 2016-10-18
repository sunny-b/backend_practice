def bubble_sort!(arr)
  repeat = true
  while repeat
    repeat = false
    0.upto(arr.size - 2) do |index|
      if arr[index] > arr[index + 1]
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
        repeat = true
      end
    end
  end
end

array = [5, 3]
bubble_sort!(array)
puts array.inspect

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array.inspect

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
puts array.inspect