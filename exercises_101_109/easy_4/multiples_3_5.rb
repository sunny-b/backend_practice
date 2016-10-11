def multisum(num)
  (1..num).to_a.select do
    |num| num % 3 == 0 || num % 5 == 0
  end.reduce(:+)
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
puts multisum(20)