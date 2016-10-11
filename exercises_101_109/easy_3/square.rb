def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

def power_to_the(power, num)
  multiply(num ** (power - 1), num)
end

puts power_to_the(, 2)