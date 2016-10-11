def twice(num)
  return num * 2 if num.to_s.length.odd?
  middle = (num.to_s.length / 2) - 1
  str = num.to_s
  if str[0..middle] == str[(middle + 1)..-1]
    return num
  end
  num * 2
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10