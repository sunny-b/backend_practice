def rotate_rightmost_digits(num, index)
  str = num.to_s.chars
  str.push(str.delete_at(index))
  str.join('')
end

def max_rotation(num)
  iterations = [num]
  counter = 0
  split_num = num.to_s.chars
  0.upto(split_num.size) do |index|
    iterations << rotate_rightmost_digits(iterations[index], index)
  end
  iterations.last.to_i
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105)
puts max_rotation(8_703_529_146) == 7_321_609_845
