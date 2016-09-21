my_array = []
print "Please enter one word at a time per line. When you wish to stop, click 'Enter': "
command = gets.chomp


while command != ""
	my_array.push command
	command = gets.chomp
end

def swap(array)  
  i =0
  while i < array.length #here is one iteration over the array

    i2 = i + 1
    while i2 < array.length #here is a second. this allows me to compare the second index (and the rest as i2 increments) to the current one
      if array[i] > array[i2]  #if the second is larger than the first
        array[i]  , array[i2] = array[i2], array[i] #switch them. this is called parallel assignment
      end # if
      i2 += 1  #increment the second loop before the first. it will keep incrementing until the end before the first one does. then the whole thing starts again until the first loop has reached the full length of the array
    end # inner loop
    i += 1
 end # outer loop
  puts array
end

puts swap(my_array)