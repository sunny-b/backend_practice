def century(year)
  prefix = year / 100
  prefix += 1 if year % 100 != 0
  suffix = ''

  last_two_numbers = prefix % 100
  last_number = prefix % 10
  if [11, 12, 13].include?(last_two_numbers)
    suffix = 'th'
  else
    suffix = case last_number
             when 1
               'st'
             when 2
               'nd'
             when 3
               'rd'
             else 'th'
             end
  end
  "#{prefix}#{suffix}"
end

puts century(2000) 
puts century(2001)
puts century(1965)
puts century(256) 
puts century(5)
puts century(10103) 
puts century(1052)
puts century(1127)
puts century(11201)
