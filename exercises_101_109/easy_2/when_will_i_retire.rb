CURRENT_YEAR = Time.now.year

print "What is your age? "
age = gets.chomp.to_i
print "At what age would you like to retire? "
retire_age = gets.chomp.to_i
difference = retire_age - age
retire_year = difference + CURRENT_YEAR

puts "It's #{CURRENT_YEAR}. You will retire in #{retire_year}."
puts "You have only #{difference} years of work to go!"