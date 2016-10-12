DIGITS = {
  'one' => ?1,
  'two' => ?2,
  'three' => ?3,
  'four' => ?4,
  'five' => ?5,
  'six' => ?6, 
  'seven' => ?7,
  'eight' => ?8,
  'nine' => ?9,
  'zero' => ?0
}

def word_to_digits(words)
  DIGITS.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGITS[word] + " ")
  end
  words.split('  ').join('').gsub(" .", '.')
end


DIGIT_WORDS = %w(zero one two three four five six seven eight nine).freeze

def word_to_digit(string)
  result = ''
  words_and_gaps = string.split(/\b/)
  words_and_gaps.each_with_index do |element, index|
    if DIGIT_WORDS.include?(element.downcase)
      # trim the space before it if the last word was a digit word, too
      if result[-1] == ' ' && DIGIT_WORDS.include?(words_and_gaps[index - 2].downcase)
        result = result[0..-2]
      end
      result << DIGIT_WORDS.index(element.downcase).to_s
    else
      result << element
    end
  end
  # format phone numbers
  result.gsub!(/\b(\d{3})(\d{3})(\d{4})\b/, '(\1) \2-\3')
  string.replace(result)
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.')
# == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
