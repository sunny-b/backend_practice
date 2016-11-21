=begin
Input: String with one or more words, with one or more spaces between words.

Output: A string that is separated by only 1 space between words, the odd
numbered words must be reversed. No space before period.

How to solve:
-Take string and remove period from end and save in var.
-Split string by space into array.
-Map through array and reverse odd index words. Join together and add period.
=end



class OddWords
  def initialize(string)
    verify(string)        # => ""
  end                     # => :initialize

  def transform
    return @string if @string.empty?                      # => true
    period = @string.chars.pop
    string_words = @string[0...-1].split(' ')
    new_string = []
    string_words.each_with_index do |word, index|
       new_string << (index.even? ? word : word.reverse)
    end
    new_string.join(' ') + period
  end                                                     # => :transform

  private  # => OddWords

  def verify(string)
    if string.gsub(/[ .]/, '').length > 20                       # => false
      raise ArgumentError, "Too many letters in your string."
    elsif string.match(/[^A-Za-z. ]/)                            # => nil
      raise ArgumentError, "String contains invalid characters"
    else
      @string = string                                           # => ""
    end                                                          # => ""
  end                                                            # => :verify
end                                                              # => :verify

OddWords.new("").transform  # => ""
