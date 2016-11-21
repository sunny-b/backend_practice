# Anagram class
class Anagram
  def initialize(set_word)
    @set_word = set_word.downcase
  end

  def match(words)
    words.select do |word|
      (word.downcase.chars.sort ==
      @set_word.chars.sort) &&
        !word.casecmp(@set_word).zero?
    end
  end
end
