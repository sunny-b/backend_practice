def balanced?(str)
  left_paran = str.count "("
  right_paran = str.count ")"
  parans = str.chars.select { |char| char.match(/[()]/) }
  
  (left_paran == right_paran) &&
  (parans.last == ')' || parans.empty?)
end

def balanced2?(str)
  special_chars = 0
  str.each_char do |char|
    special_chars += 1 if char.match(/[({\[]/)
    special_chars -= 1 if char.match(/[)}\]]/)
    break if parens < 0
  end

  parens.zero?
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false