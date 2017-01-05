number = nil

loop do
  puts '>> How many output lines do you want? Enter a number >= 3'
  number = gets.chomp.to_i

  break if number >= 3
  puts 'That\'s not enough lines.'
end

number.times { puts 'Launch School is the best!' }


