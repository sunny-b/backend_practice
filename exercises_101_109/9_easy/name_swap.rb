def swap_name(str)
  str.split.reverse.join(', ')
end

puts swap_name('Joe Roberts')