#Create a method to calculate the fibonacci number

def fibbonaci(fibonacci_numbers)
  
end

def find_fibonacci_index_by_length(digit_length)
  return 1 if digit_length <= 1
  fibonacci_numbers = [1, 1]
  counter = 2
  loop do
      break if fibonacci_numbers.last.to_s.length >= digit_length
      fibonacci_numbers << fibonacci_numbers[-1] + fibonacci_numbers[-2]
      counter += 1
  end
  counter
end

puts find_fibonacci_index_by_length(2)
puts find_fibonacci_index_by_length(10)
puts find_fibonacci_index_by_length(100)
puts find_fibonacci_index_by_length(1000)
puts find_fibonacci_index_by_length(10000)
