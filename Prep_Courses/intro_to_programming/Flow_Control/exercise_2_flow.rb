def to_caps(string)
  if string.length > 10
    puts string.upcase
    return string.upcase
  else
    puts string
    return string
  end
end

to_caps(gets.chomp)