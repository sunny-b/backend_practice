def add_three(number)
  number + 3
end

return_value = add_three(4)
puts return_value

def just_assignment(number)
  foo = number + 3
end

def add_threes(n)
  n + 3
end

add_threes(5)

add_threes(5).times {puts 'this should print 8 times'}