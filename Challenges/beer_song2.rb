class BeerSong
  def verse(beer_num)
    Verse.new(beer_num).generate
  end

  def verses(verse1, verse2)
    stanzas = (verse2..verse1).to_a.reverse
    stanzas.each_with_object('') do |beer_num, song|
      song << verse(beer_num) + "\n"
    end.chomp
  end

  def lyrics
    verses(99, 0)
  end
end

class Verse
  def initialize(number)
    @number = number
  end

  def generate
    lyric_hash = Hash.new(standard)
    special_lyrics = {2 => beer_2_line, 1 => beer_1_line, 0 => last_line }
    lyric_hash.merge!(special_lyrics)

    lyric_hash[@number]
  end

  private

  def standard
    <<~MSG
    #{@number} bottles of beer on the wall, #{@number} bottles of beer.
    Take one down and pass it around, #{@number - 1} bottles of beer on the wall.
    MSG
  end

  def beer_2_line
    <<~MSG
    2 bottles of beer on the wall, 2 bottles of beer.
    Take one down and pass it around, 1 bottle of beer on the wall.
    MSG
  end

  def beer_1_line
    <<~MSG
    1 bottle of beer on the wall, 1 bottle of beer.
    Take it down and pass it around, no more bottles of beer on the wall.
    MSG
  end

  def last_line
    <<~MSG
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    MSG
  end
end
