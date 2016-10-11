def penultimate(string)
  return string if string.length < 2
  middle = string.split.size
  string.split[middle]
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'