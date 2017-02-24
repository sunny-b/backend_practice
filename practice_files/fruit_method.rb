HEXADEMICAL = %w(1 2 3 4 5 6 7 8 9 0 a b c d e f)  # => ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "a", "b", "c", "d", "e", "f"]

def uuid
  group_1 = 8.times.with_object("") { |_, string| string << HEXADEMICAL.sample }   # => "0a580bd3"
  group_2 = 4.times.with_object("") { |_, string| string << HEXADEMICAL.sample }   # => "ad8e"
  group_3 = 4.times.with_object("") { |_, string| string << HEXADEMICAL.sample }   # => "4aa1"
  group_4 = 4.times.with_object("") { |_, string| string << HEXADEMICAL.sample }   # => "b825"
  group_5 = 12.times.with_object("") { |_, string| string << HEXADEMICAL.sample }  # => "6442e98450ac"

  "#{group_1}-#{group_2}-#{group_3}_#{group_4}-#{group_5}"  # => "0a580bd3-ad8e-4aa1_b825-6442e98450ac"
end                                                         # => :uuid

uuid  # => "0a580bd3-ad8e-4aa1_b825-6442e98450ac"
