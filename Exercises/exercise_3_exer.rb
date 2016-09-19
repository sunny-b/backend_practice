array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
new_array = []
new_array = array.select{|num| num.odd? }

p new_array