class Phrase
  def initialize(string)
    @phrase = string
  end

  def word_count
    word_count = Hash.new(0)
    @phrase.scan(/\b[\w']+\b/) { |word| word_count[word.downcase] += 1 }
    word_count
  end
end
