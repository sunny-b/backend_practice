def palindromic_number?(num)
  num.to_s.reverse == num.to_s
end

def display_num_string(num)
  "#{num}".chars.each do |char|
      p char
    end
end

display_num_string(004400)

def palindromic_number2?(number)
  num = -1
  return false unless number == number.to_i 
  rev_array = Array.new("#{number}".length)
  "#{number}".chars.each do |char|
    rev_array[num] = char.to_i
    num -= 1 
  end
  number == rev_array.join.to_i
end

puts palindromic_number2?(004400)