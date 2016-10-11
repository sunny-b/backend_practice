require 'pry'

def remove_vowels(string_arr)
  string_arr.map do |str|
    if str.match(/[AEIOUaeiou]/)
      str.gsub!(/[AEIOUaeiou]/, '')
    else
      next
    end
  end
  string_arr
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)).inspect
puts remove_vowels(%w(green YELLOW black white)).inspect
puts remove_vowels(%w(ABC AEIOU XYZ)).inspect