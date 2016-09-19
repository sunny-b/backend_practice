# The difference is that merge! permanently changes the caller while 
# merge does not

h1 = { "a" => 100, "b" => 200 }
h2 = { "b" => 254, "c" => 300 }

puts "Before merge #{h1}"
h1.merge(h2)
puts "After merge #{h1}"

puts

puts "Before merge! #{h1}"
h1.merge!(h2)
puts "After merge! #{h1}"