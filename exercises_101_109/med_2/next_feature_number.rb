require 'pry'

def featured(num)
  num += 1 
  num += 1 until num.odd? && num % 7 == 0
  feature = num

  loop do
    does_not_repeat = feature.to_s.chars.uniq.join.to_i == feature
    if feature.odd? && does_not_repeat
      break
    elsif feature.to_s.length > 10
      feature = "Error: not possible"
      break
    end
    feature += 14
  end
  feature
end

puts featured(12)
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987

puts featured(9_999_999_999)
