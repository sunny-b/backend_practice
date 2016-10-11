puts 'Please write a word or multiple words:'
string = gets.chomp

puts "There are #{string.gsub(' ', '').length} characters in \"#{string}\""