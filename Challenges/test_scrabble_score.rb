require 'minitest/autorun'         # => true
require_relative 'scrabble_score'  # => true

class ScrabbleTest < Minitest::Test         # => Minitest::Test
  def test_empty_word_scores_zero
    assert_equal 0, Scrabble.new('').score
  end                                       # => :test_empty_word_scores_zero

  def test_whitespace_scores_zero

    assert_equal 0, Scrabble.new(" \t\n").score  # => true
  end                                            # => :test_whitespace_scores_zero

  def test_nil_scores_zero

    assert_equal 0, Scrabble.new(nil).score  # => true
  end                                        # => :test_nil_scores_zero

  def test_scores_very_short_word

    assert_equal 1, Scrabble.new('a').score  # => true
  end                                        # => :test_scores_very_short_word

  def test_scores_other_very_short_word

    assert_equal 4, Scrabble.new('f').score  # => true
  end                                        # => :test_scores_other_very_short_word

  def test_simple_word_scores_the_number_of_letters

    assert_equal 6, Scrabble.new('street').score  # => true
  end                                             # => :test_simple_word_scores_the_number_of_letters

  def test_complicated_word_scores_more

    assert_equal 22, Scrabble.new('quirky').score  # => true
  end                                              # => :test_complicated_word_scores_more

  def test_scores_are_case_insensitive

    assert_equal 41, Scrabble.new('OXYPHENBUTAZONE').score  # => true
  end                                                       # => :test_scores_are_case_insensitive

  def test_convenient_scoring

    assert_equal 13, Scrabble.score('alacrity')  # => true
  end                                            # => :test_convenient_scoring
end                                              # => :test_convenient_scoring

# >> Run options: --seed 41070
# >>
# >> # Running:
# >>
# >> .F.......
# >>
# >> Finished in 0.003532s, 2547.9279 runs/s, 2547.9279 assertions/s.
# >>
# >>   1) Failure:
# >> ScrabbleTest#test_empty_word_scores_zero [/Users/sunny/Documents/launch_school/Challenges/test_scrabble_score.rb:6]:
# >> Expected: 0
# >>   Actual: nil
# >>
# >> 9 runs, 9 assertions, 1 failures, 0 errors, 0 skips
