def short_long_short(str1, str2)
  long = str1.length > str2.length ? str1 : str2
  short = str1.length > str2.length ? str2 : str1
  short + long + short
end
  
puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"  