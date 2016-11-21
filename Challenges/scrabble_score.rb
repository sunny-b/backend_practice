class Scrabble
  LETTER_POINTS = {
    %w(A E I O U L N R S T) => 1,           # => 1
    %w(D G)                 => 2,           # => 2
    %w(B C M P)             => 3,           # => 3
    %w(F H V W Y)           => 4,           # => 4
    %w(K)                   => 5,           # => 5
    %w(J X)                 => 8,           # => 8
    %w(Q Z)                 => 10 }.freeze  # => {["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]=>1, ["D", "G"]=>2, ["B", "C", "M", "P"]=>3, ["F", "H", "V", "W", "Y"]=>4, ["K"]=>5, ["J", "X"]=>8, ["Q", "Z"]=>10}

  def initialize(word)
    @word = word        # => "f"
  end                   # => :initialize
 
  def score
    self.class.score(@word)  # => 4
  end                        # => :score

  def self.score(word)
    return 0 if word.nil? || word.empty? || word.match(/[^A-Za-z]/)           # => nil
    word.upcase.chars.map do |letter|                                         # => ["F"]
      letters = LETTER_POINTS.keys.select { |group| group.include?(letter) }  # => [["F", "H", "V", "W", "Y"]]
      LETTER_POINTS[letters.first]                                            # => 4
    end.reduce(:+)                                                            # => 4
  end                                                                         # => :score
end                                                                           # => :score

Scrabble.new('f').score  # => 4
