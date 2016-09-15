grandma = gets.chomp
counter = 0
while (counter != 3)
	if grandma == "BYE"
			counter += 1
			if counter == 3
				break
			end
		
	elsif grandma.upcase == grandma
		puts "NO, NOT SINCE " + rand(1930..1950).to_s
		
	else
		puts "HUH!? SPEAK UP, SONNY!"
		counter = 0
	end
	grandma = gets.chomp
end

puts "SEE YA LATER, SONNY!"