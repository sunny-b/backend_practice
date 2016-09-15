print "Enter a starting year: "
startYear = gets.chomp.to_i
print "Please enter an ending year: "
endYear = gets.chomp.to_i

for num in startYear..endYear
	if (num%4==0 and num%100 != 0) or (num%400==0)
		puts num
	end 
end