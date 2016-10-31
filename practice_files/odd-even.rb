require 'pry'

def sort_my_string(s)
  str = 0.step(s.size - 1, 2).map { |i| s[i] }.join + " "
  str += 1.step(s.size - 1, 2).map { |i| s[i] }.join
end

p sort_my_string("YCOLUE'VREER")