def grade_letter(avg)
  if (90..100).cover? avg
    'A'
  elsif (80...90).cover? avg
    'B'
  elsif (70...80).cover? avg
    'C'
  elsif (60...70).cover? avg
    'D'
  else 
    'F'
  end
end

def get_grade(num1, num2, num3)
  average = (num1 + num2 + num3) / 3
  grade_letter(average)
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"