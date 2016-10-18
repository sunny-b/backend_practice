def letter_percentages(str)
  letter_case_count = Hash.new(0)
  length = str.length

  letter_case_count[:lowercase] = (str.count("a-z") / length.to_f) * 100.0
  letter_case_count[:uppercase] = (str.count("A-Z") / length.to_f) * 100.0
  letter_case_count[:neither] = (str.count("^A-Za-z") / length.to_f) * 100.0
  letter_case_count
end

puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }