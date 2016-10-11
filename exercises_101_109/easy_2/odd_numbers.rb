(1..99).each do |num|
  puts num if num.odd?
end

puts (1..99).to_a.select { |num| num.odd? }