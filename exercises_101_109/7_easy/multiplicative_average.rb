def show_multiplicative_average(arr)
  avg = format('%0.3f', arr.reduce(:*).to_f / arr.size.to_f)
  puts "The result is #{avg}"
end

show_multiplicative_average([3, 5])
show_multiplicative_average([2, 5, 7, 11, 13, 17])