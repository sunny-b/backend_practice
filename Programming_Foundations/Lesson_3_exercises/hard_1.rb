#Q4#####################

HEXADECIMAL_CHARS = ('a'..'f').to_a + ('0'..'9').to_a

def create_uuid
  template = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  uuid = ""
  dash_index = template.split("").each_index.select do |index|
    template[index] == '-'
  end

  template.length.times do |num|
    uuid << dash_index.include?(num) ? '-' : HEXADECIMAL_CHARS.sample
  end

  uuid
end

def create_another_uuid
  uuid = ""
  uuid_sequence = [8, 4, 4, 4, 12]

  uuid_sequence.each_with_index do |sequence, index|
    sequence.times { |_| uuid << HEXADECIMAL_CHARS.sample }
    uuid << '-' unless index >= uuid_sequence.size - 1
  end

  uuid
end

puts create_another_uuid

def create_yet_another_uuid
  blank_uuid = ['xxxxxxxx', 'xxxx', 'xxxx', 'xxxx', 'xxxxxxxxxxxx']
  
  complete_uuid = blank_uuid.map do |sequence|
                    sequence.split('').map do |char| 
                      char.sub(char, HEXADECIMAL_CHARS.sample) 
                    end.join
                  end

  complete_uuid.join('-')
end

puts create_yet_another_uuid


#Q5########################

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.size != 4
    false
  else
    while dot_separated_words.size > 0 do 
      word = dot_separated_words.pop
      return false if !is_an_ip_number?(word)
    end
  end
  true
end
