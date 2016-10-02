#Q1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.key? "Spot"

ages.select { |k, v| k == "Spot"}

ages.has_key? "Spot"

ages.member?

ages.include?

#Q2 
total_age = 0
ages.each do |name, age|
  total_age += age
end 

puts total_age

ages.values.inject(:+)

#Q3

ages.select { |name, age| age < 100 }
ages.keep_if { |_, age| age < 100 }

#Q4

munsters_description = "The Munsters are creepy in a good way."

munsters_description.capitalize || capitalize!
munsters_description.swapcase || swapcase!
munsters_description.downcase || downcase!
munsters_description.upcase || upcase!

#Q5 

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)

#Q6

ages.min || ages.values.min

#Q7

advice.include?("Dino") || advice.match("Dino")

#Q8

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |char, index|
  p index if char.include?("Be")
end

or

flintstones.index { |char| char[0,2] == "Be" || char[0...2] == "Be"}

#Q9 and #Q10

flintstones.map! { |char| char = char[0..2] || char = char[0, 3]}

