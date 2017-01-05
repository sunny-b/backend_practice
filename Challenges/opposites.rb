def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def valid_entries?(nums)
  nums.reduce(:*) < 0
end

loop do
  nums = []
  loop do
    puts '>> Please enter a positive or negative integer:'
    answer = gets.chomp

    if valid_number? answer
      nums << answer.to_i
      break if nums.size == 2
    else
      puts '>> Invalid input. Only non-zero integers are allowed.'
    end
  end
  
  if valid_entries?(nums)
    break puts ">> #{nums.first} + #{nums.last} = #{nums.reduce(:+)}"
  else
    puts '>> Sorry. One integer must be positive, one must be negative.'
    puts '>> Please start over.'
  end
end
  
