def sequence(counter, step)
  sequence_arr = []
  counter.times { |num| sequence_arr << (num + 1) * step }
  sequence_arr
end

def sequence2(upto_num, step)
  (1..upto_num).map { |num| num * step }
end

puts sequence2(5, 1) == [1, 2, 3, 4, 5]
puts sequence2(4, -7) == [-7, -14, -21, -28]
puts sequence2(3, 0) == [0, 0, 0]
puts sequence2(0, 1000000) == []
