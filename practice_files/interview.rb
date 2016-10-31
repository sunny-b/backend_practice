# Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

# Numerical Score Letter Grade 90 <= score <= 100 'A' 80 <= score < 90 'B' 70 <= score < 80 'C' 60 <= score < 70 'D' 0 <= score < 60 'F'

# Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

# Test Cases:

def get_grade(score1, score2, score3)
  average = (score1 + score2 + score3) / 3

  determine_grade(average)
end

def determine_grade(average)
  case 
  when average > 100
    'A++'
  when (90..100).cover?(average)
    'A'
  when (80...90).cover?(average)
    'B'
  when (70...80).cover?(average)
    'C'
  when (60...70).cover?(average)
    'D'
  else 'F'
  end
end


# p get_grade(95, 90, 93) == "A"
# p get_grade(50, 50, 95) == "D"

# BONUS: If you have enough time, how would you implement an additional feature to determine if a student scored over 100 points?

# p get_grade(105, 110, 101)




#----------------------------------------------

# Write a method that takes an Array of numbers, and returns an Array
# with the same number of elements, and each element has the running
# total from the original Array.

# Test Cases

def running_total(arr)
  sum = 0
  
  arr.map {|num| sum += num }
end


p running_total([2, 5, 13]) == [2, 7, 20] # => true
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67] # => true









