class RunLengthEncoding
  def self.encode(string)
    encoded = ''
    first_idx, end_idx, current_char = 0, 0, string[0]

    while end_idx < string.length
      while string[end_idx] == current_char
        end_idx += 1
      end
      run_length = (end_idx - first_idx).to_s
      run_length = '' if run_length == '1'
      encoded << run_length + current_char
      first_idx = end_idx
      current_char = string[end_idx]
    end
    encoded
  end

  def self.decode(string)
    decoded = ''
    first_idx, end_idx = 0, 0

    while end_idx < string.length
      if string[end_idx] =~ /\d/
        first_idx = end_idx
        while string[end_idx] =~ /\d/
          end_idx += 1
        end
        num = string[first_idx..(end_idx - 1)].to_i
        decoded << string[end_idx] * num
      else
        decoded << string[end_idx]
      end
      end_idx += 1
    end
    decoded
  end
end

RunLengthEncoding.decode('12A5BC10F')
