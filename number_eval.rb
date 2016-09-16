def number_eval
  print "Please print a number above 0: "
  number = gets.chomp.to_i
  answer = case
  when number <= 50
    "a is between 0 and 50"
  when number <= 100
    "a is between 51 and 100"
  else
    "number is above 100"
  end
  puts answer
end

number_eval