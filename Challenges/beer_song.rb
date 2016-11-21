class BeerSong
  def verse(beer_num)
    generate_song_line(beer_num)
  end


  def verses(verse1, verse2)
    stanzas = (verse2..verse1).to_a.reverse
    song = ""
    stanzas.each_with_index do |beer_num, index|
      song << generate_song_line(beer_num)
      break if index == stanzas.size - 1
      song << "\n"
    end
    song
  end

  def lyrics
    self.verses(99, 0)
  end

  private

  def generate_song_line(number)
    number = number.zero? ? 'no more' : number.to_s
    one_less = if number.to_i.zero?
                 '99'
               elsif number.to_i == 1
                 'no more'
               else
                 (number.to_i - 1).to_s
               end
    number += add_bottle(number)
    one_less += add_bottle(one_less)

    song_line(number, one_less)
  end

  def song_line(number, one_less)
    if number.to_i == 1
      "#{number} of beer on the wall, #{number} of beer.\n" \
      "Take it down and pass it around, #{one_less} of beer on the wall.\n"
    elsif !number.to_i.zero?
      "#{number} of beer on the wall, #{number} of beer.\n" \
      "Take one down and pass it around, #{one_less} of beer on the wall.\n"
    else
      "#{number.capitalize} of beer on the wall, #{number} of beer.\n" \
      "Go to the store and buy some more, #{one_less} of beer on the wall.\n"
    end
  end

  def add_bottle(number)
    case number.to_i
    when 1 then " bottle"
    else " bottles"
    end
  end
end
