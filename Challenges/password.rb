PASSWORD = 'Secret'

loop do
  puts '>> Please enter your password:'
  answer = gets.chomp
  break if answer == PASSWORD
  puts 'Invalid Password!'
end

puts 'Welcome!'
