Given two integers

Create a method
  -Set a variable that saves the result of the sum
  -print the result to the screen


Start

GET number 1 from user
SET num1 as the user's input
GET number 2 from user
SET num2 as the user's input 

SET method that takes two numbers as parameters
  SET result = sum of two numbers
  PRINT result
END


------------------------

Given a collection of strings.

Combine all the strings together
  -Use ". " as a separation between each string.

After joining strings together, print to the string.

START

#given a collection of strings

SET concat_string = result of calling join(". ") on the array

PRINT concat_string 

END


---------------

Given a collection of integets

Create a new array to house values

Iterate over the collection
  -If the index value of array is odd, skip
  -Else, push that value to the new array

After iterating, return new array.

START

#Given a collection of integers

SET new_array = []

WHILE iterator < length of array
  IF index value is odd
    skip to next iteration
  ELSE
    push value of iterator to the new array

  iterator = iterator + 1

PRINT new_array

END
