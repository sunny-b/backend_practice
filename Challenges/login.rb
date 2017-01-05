USERNAME = 'admin'
PASSWORD = 'SecreT'

loop do
  puts '>> Please enter your username:'
  user_attempt = gets.chomp

  puts '>> Please enter your password:'
  password_attempt = gets.chomp

  break if user_attempt == USERNAME && password_attempt == PASSWORD
  puts '>> Authorization failed'
end

puts 'Welcome!'
