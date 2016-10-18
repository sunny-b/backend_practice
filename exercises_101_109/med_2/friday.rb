require 'Date'

def friday_13th?(year)
  counter = 0
  1.upto(12) do |month|
    counter += 1 if Date.new(year, month, 13).friday?
  end
  counter
end

def friday_7th?(year)
  counter = 0
  1.upto(12) do |month|
    counter += 1 if Date.new(year, month, 7).friday?
  end
  counter
end

 def friday_second_to_last?(year)
  counter = 0
  1.upto(12) do |month|
    counter += 1 if Date.new(year, month, -2).friday?
  end
  counter
end

puts friday_13th?(2015)
puts friday_13th?(1986)