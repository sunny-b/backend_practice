def greetings(name, options = {})
  if options.empty?
    puts "Hi, name name is #{name}"
  else 
    puts "Hi, my name is #{name} and I'm #{options[:age]}" + " years old and I live in #{options[:city]}"
  end
end

greetings("Bob")
greetings("Bob", age: 62, city: "New York City")