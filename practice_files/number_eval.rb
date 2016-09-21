def number
  print "Please print a number above 0: "
  return gets.chomp.to_i
end

def eval (num)
  answer = case
  when num <= 50
    "a is between 0 and 50"
  when num <= 100
    "a is between 51 and 100"
  else
    "number is above 100"
  end
  puts answer
end

eval(number)