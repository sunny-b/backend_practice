def rotate_array(arr)
  rotate_arr = arr.clone
  rotate_arr.push(rotate_arr.shift)
end

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

puts x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                # => true

def rotate(str)
  str[1..-1] + str[0]
end

def rotate_num(num)
  rotated = num.to_s[1..-1] + num.to_s[0]
  rotated.to_i
end

puts rotate('Hello')
puts rotate_num(384798)