def sort(array)
  if array.length <= 2
    array = array.reverse if array.first > array.last
    return array
  end

  left,right = array.each_slice( (array.size/2.0).round ).to_a
  l_array = sort(left)
  r_array = sort(right)
  r_counter = 0
  l_counter = 0
  sorted_array = []

  while (l_counter < l_array.size) ||
        (r_counter < r_array.size)
    if l_counter >= l_array.size
      sorted_array << r_array[r_counter]
      r_counter += 1
    elsif r_counter >= r_array.size
      sorted_array << l_array[l_counter]
      l_counter += 1
    elsif l_array[l_counter] < r_array[r_counter]
      sorted_array << l_array[l_counter]
      l_counter += 1
    else
      sorted_array << r_array[r_counter]
      r_counter += 1
    end
  end

  sorted_array
end

p sort([7,6,5,4,3,2,1])
