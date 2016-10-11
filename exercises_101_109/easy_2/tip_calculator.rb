print 'What is the bill? '
bill = gets.chomp.to_f
print 'What is the tip percentage you would like to leave? '
tip_percent = (gets.chomp.to_f) / 100

tip_amount = (bill * tip_percent).round(2)
total = (bill + tip_amount).round(2)

puts "The tip is $#{format('%.2f', tip_amount)}"
puts "The total is $#{format('%.2f', total)}"

