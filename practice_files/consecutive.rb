# This is a program that finds how many numbers are 
# needed to form a consecutive array. Ex. [3, 6] would 
# return 2 because it needs 4 and 5 to make it consecutive.

def consecutive(arr)
  if arr.length <= 1
    return 0
  else 
    arr = arr.sort
    dif = arr.last - arr.first
    return dif - arr.length + 1
  end
end