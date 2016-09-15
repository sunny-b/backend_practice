command = ""

while command.downcase != "bye"
	command = gets.chomp
	puts command
end

puts "Come again soon!"