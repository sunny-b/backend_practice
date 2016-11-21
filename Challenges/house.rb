class House
  def self.recite
    song = pieces.reverse
    whole = ''

    build(whole, song).chomp
  end

  private

  def self.build(whole, song)
    song.size.times do |num|
      whole << 'This is '
      num.downto(0) do |verse|
        whole << song[verse][0]
        whole << (verse.zero? ? ".\n\n" : "\n")
        whole << (song[verse][1] + ' ') if verse > 0
      end
    end
    whole
  end

  def self.pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end

House.recite
