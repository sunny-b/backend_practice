ALPHA_NUM = {
  0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five',
  6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten',
  11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen',
  16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen'
}

def alphabetical_number_sort(array)
  new_array = array.map { |num| ALPHA_NUM[num] }
  new_array = new_array.sort.map { |word| ALPHA_NUM.key(word) }
  new_array
end

puts alphabetical_number_sort((0..19).to_a).inspect