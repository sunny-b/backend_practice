class PigLatin
  def initialize(word)
    @words = word.split
  end

  def self.translate(word)
    pig_word = PigLatin.new(word)
    pig_word.translate
  end

  def translate
    @words.map do |word|
      vowel_pos = find_vowel(word)
      word = word.chars
      word.push(word.shift(vowel_pos) + ['ay']).join
    end.join(' ')
  end

  private

  def find_vowel(word)
    if word[0..1] == 'yt' || word[0..1] == 'xr'
      0
    elsif word[0..1] == 'qu'
      2
    elsif word[0..2] == 'squ'
      3
    else
      no_special_case(word)
    end
  end

  def no_special_case(word)
    count = 0
    loop do
      word[count].match(/[aeiou]/) ? break : count += 1
    end
    count
  end

end

PigLatin.translate('school')
