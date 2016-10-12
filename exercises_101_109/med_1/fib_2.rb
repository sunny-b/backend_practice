def fibonacci(n)
  return 1 if n <= 2
  fib_num_1 = 1
  fib_num_2 = 1
  sum = nil
  (n-2).times do 
    sum = fib_num_1 + fib_num_2
    fib_num_1 = fib_num_2
    fib_num_2 = sum
  end
  sum
end

puts fibonacci(20)
puts fibonacci(100)
puts fibonacci(100001)