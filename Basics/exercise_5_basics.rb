def factorial number
  num = 1
  while number > 0
    num *= number
    number -= 1
  end
  puts num
end

factorial(5)
factorial(6)
factorial(7)
factorial(8)
