def letter_case_count(str)
  letter_case_count = Hash.new(0)

  letter_case_count[:lowercase] = str.count("a-z")
  letter_case_count[:uppercase] = str.count("A-Z")
  letter_case_count[:neither] = str.count("^A-Za-z")
  letter_case_count
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
