a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

new_array = a.map { |words| words.split(" ") }.flatten

p new_array