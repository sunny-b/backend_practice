person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

person.each do |k, v|
  puts k
end

puts

person.each do |k, v|
  puts v
end

puts

person.each do |k, v|
  puts "#{k}: #{v}"
end