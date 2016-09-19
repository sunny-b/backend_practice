def greet(name)
  return "Greetings, #{name}!"
end

print "Hello there, what is your name? "
name = gets.chomp
puts greet(name)