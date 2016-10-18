require 'pry'

BLOCKS = {
  'B' => 'O',
  'G' => 'T',
  'V' => 'I',
  'X' => 'K',
  'R' => 'E',
  'L' => 'Y',
  'D' => 'Q',
  'F' => 'S',
  'Z' => 'M',
  'N' => 'A',
  'H' => 'U',
  'C' => 'P',
  'J' => 'W'
}

def block_word?(str)
  used_blocks = {}
  letters = str.upcase.chars
  letters.each do |char|
    return false if used_blocks.has_value?(char) || used_blocks.has_key?(char)
    
    if BLOCKS.keys.include?(char)
      used_blocks[char] = BLOCKS[char]
    else
      used_blocks[BLOCKS.key(char)] = char
    end
  end
  true
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true

