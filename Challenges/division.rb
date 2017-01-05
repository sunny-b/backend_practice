numerator = nil
denominator = nil

loop do
  puts '>> Please enter the numerator:'
  numerator = gets.chomp

  break if numerator.to_i.to_s == numerator
  puts 'Invalid input. Only integers are allowed.'
end

loop do
  puts '>> Please enter the denominator:'
  denominator = gets.chomp

  break if denominator.to_i.to_s == denominator && !denominator.to_i.zero?
  
  if denominator == '0'
    puts '>> Invalid input. A denominator of 0 is not allowed.'
  else
    puts 'Invalid input. Only integers are allowed.'
  end
end

puts ">> #{numerator} / #{denominator} is #{numerator.to_i / denominator.to_i}"

  
