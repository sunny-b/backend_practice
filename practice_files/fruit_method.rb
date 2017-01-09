HEXADEMICAL = %w(1 2 3 4 5 6 7 8 9 0 a b c d e f)

def UUID
  group_1 = 8.times.with_object("") do { |string| string << HEXADEMICAL.sample }
  group_2
  group_3
  group_4
  group_5
end
