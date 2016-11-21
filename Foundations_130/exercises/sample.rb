require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

long_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sed vulputate ipsum.
Suspendisse commodo sem arcu. Donec a nisi elit. Nullam eget nisi commodo, volutpat
quam a, viverra mauris. Nunc viverra sed massa a condimentum. Suspendisse ornare justo
nulla, sit amet mollis eros sollicitudin et. Etiam maximus molestie eros, sit amet dictum
dolor ornare bibendum. Morbi ut massa nec lorem tincidunt elementum vitae id magna. Cras
et varius mauris, at pharetra mi."

class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count
    @text.split.count
  end
end

class TextTest < MiniTest::Test
  def setup
    @file = File.open('./sample_text.txt', 'r')
  end

  def test_letter_swap
    text = Text.new(@file.read)
    message = <<~MSG
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    MSG

    assert_equal(message, text.swap('a', 'e'))
  end

  def test_word_count
    text = Text.new(@file.read)
    word_count = text.word_count
    words = 72

    assert_equal(words, word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end
