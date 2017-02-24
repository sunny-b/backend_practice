def substring(word, start, limit = start)
  word[start..limit]
end                                        # => :substring

def substrings(word)
  sub_strings = []                           # => []
  2.upto(word.length) do |length|            # => 2
    word.chars.each_cons(length) do |group|  # => ["b", "u", "b", "b", "l", "e", "s"], ["b", "u", "b", "b", "l", "e", "s"], ["b", "u", "b", "b", "l", "e", "s"], ["b", "u", "b", "b", "l", "e", "s"], ["b", "u", "b", "b", "l", "e", "s"], ["b", "u", "b", "b", "l", "e", "s"]
      sub_strings << group.join              # => ["bu"], ["bu", "ub"], ["bu", "ub", "bb"], ["bu", "ub", "bb", "bl"], ["bu", "ub", "bb", "bl", "le"], ["bu", "ub", "bb", "bl", "le", "es"], ["bu", "ub", "bb", "bl", "le", "es", "bub"], ["bu", "ub", "bb", "bl", "le", "es", "bub", "ubb"], ["bu", "ub", "bb", "bl", "le", "es", "bub", "ubb", "bbl"], ["bu", "ub", "bb", "bl", "le", "es", "bub", "ubb", "bbl", "ble"], ["bu", "ub", "bb", "bl", "le", "es", "bub", "ubb", "bbl", "ble", "les"], ["bu", "ub", "bb", "bl", "le", "es", "bub", "ubb", "bbl", "ble", "les", "bubb"], ["bu", "ub", "bb", "bl", "le", "es", "bub", "ubb", "bbl", "ble", "les", "bubb", "ubbl"], ["bu", "ub", "bb", "bl", "le", "es", "bub", "ubb", "bbl", "ble", "les", "bubb", "ubbl", "bble"], ["bu", "ub", "bb", "bl", "le", "es", "bub", "ubb", "bbl", "ble", "les", "bubb", "ubbl", "bble", "bles"], ["bu", "ub", "bb", "bl", "le", "es", "bub", "ubb", "bbl", "ble", "les", "bubb", "ubbl", "bble", "bles", "bubbl"], ["bu", "ub", "bb", "bl", "le...
    end                                      # => nil, nil, nil, nil, nil, nil
  end                                        # => 2
  sub_strings                                # => ["bu", "ub", "bb", "bl", "le", "es", "bub", "ubb", "bbl", "ble", "les", "bubb", "ubbl", "bble", "bles", "bubbl", "ubble", "bbles", "bubble", "ubbles", "bubbles"]
end                                          # => :substrings

def palindromes(word)
  substrings(word).select { |palin| palin.reverse == palin }  # => ["bb", "bub"]
end                                                           # => :palindromes

def longest_palindrome(word)
  palindromes(word).max_by { |palin| palin.length}  # => "bub"
end                                                 # => :longest_palindrome

longest_palindrome('bubbles')  # => "bub"
