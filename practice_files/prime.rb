def is_prime? (num)
  num = num.to_i
  if (num == 2 || num == 3)
    return true
  else
    (2..num-1).each do |number|
      if (num%number) == 0
        return false
      end
    end
    true
  end
end

puts is_prime?(2)
puts is_prime?(3)
puts is_prime?(4)
puts is_prime?(5)
puts is_prime?(6) 
puts is_prime?(7)