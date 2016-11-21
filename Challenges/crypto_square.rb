class Crypto
  def initialize(string)
    @string = string.gsub(/[^0-9A-Za-z]/, '').downcase
  end

  def normalize_plaintext
    @string
  end

  def size
    Math.sqrt(@string.length).ceil
  end

  def plaintext_segments
    @string.chars.each_slice(size).map(&:join)
  end

  def ciphertext
    cipher_segments = plaintext_segments
    word_num = cipher_segments.first.length
    length = cipher_segments.size
    cipher_text = []

    word_num.times do |idx|
      cipher_segments.each do |word|
        cipher_text << word[idx]
      end
    end
    @cipher = cipher_text.each_slice(length).map(&:join)
    @cipher.join
  end

  def normalize_ciphertext
    ciphertext
    @cipher.join(' ')
  end
end
