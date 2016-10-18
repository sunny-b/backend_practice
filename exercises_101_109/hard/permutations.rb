require 'pry'

def permutations2(arr)
  num_of_poss = 1
  1.upto(arr.size) { |num| num_of_poss *= num }
  perms = []

  while perms.size < num_of_poss
    new_arr = arr.shuffle
    perms << new_arr unless perms.include?(new_arr)
  end
  perms
end

def permutations(array)
  binding.pry
  return [array] if array.size == 1

  result = []
  array.each_with_index do |element, index|
    sub_array = array[0...index] + array[(index + 1)..-1]
    binding.pry
    sub_permutations = permutations(sub_array)
    sub_permutations.each do |permutation|
      binding.pry
      result << [element] + permutation
    end
  end

  result
end

def permutations3(integer, array)
  return array if integer == 1

  result = [array]
  counter = 0
  while true
    permutations3(integer - 1, array)
    if counter == (integer - 1)
      break
    end
    if integer.even?
      array[counter], array[integer - 1] = array[integer - 1], array[counter]
    else
      array[0], array[integer - 1] = array[integer - 1], array[0]
    end
    result << array
    counter += 1
  end
  result
end



# p permutations([2])
# # -> [[2]]

# p permutations([1, 2])
# # -> [[1, 2], [2, 1]]

p permutations3(3, [1, 2, 3])
# -> [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]

p permutations3(4, [1, 2, 3, 4])
