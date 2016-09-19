print "Please tell me your first name: "
first_name = gets.chomp
print "Please tell me your last name: "
last_name = gets.chomp
name = first_name + " " + last_name
puts "Hello there #{name}!"

10.times do |n|
  puts name
end  
