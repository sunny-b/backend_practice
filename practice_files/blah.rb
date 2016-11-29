class BeerSong
  def verse(number)
    @number = number

    case @number
    when 3..99 then standard_verse
    when 2 then verse_2
    when 1 then verse_1
    when 0 then final_verse
    end
  end

  def standard_verse
    "#{@number} bottles of beer on the wall, #{@number} bottles of beer.\n" \
    "Take one down and pass it around, #{@number - 1} bottles of beer on the wall.\n"
  end

  def verse_2
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def verse_1
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def final_verse
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def lyrics
    song = ''
    99.downto(0) do |num|
      song << verse(num)
      song << "\n" unless num.zero?
    end
    song
  end
end

puts BeerSong.new.lyrics
