#Q1

output = [1, 2, 3] # incorrect

1
2
2
3 #correct


#Q2

#1. != means "not equal to" and it is used 
      #When seeing if two elements are NOT equal

#2. ! before an element means "not", and returns a boolean value the opposite of user_name. So if user_name was false, it would now be true, and if it was true, it would return false. 

#3. ! after something is a "bang" and mutates the caller if the method allows for it. words.uniq! would change the caller "words" permanently. You would use it when you want to mutate the caller.

#4. ? before a single character is the shortest way to create a single character string. It cannot accept more than one character.

#5. ? after something denotes that that element will return a boolean. You use it to check if a sitaution is true or false. Such as .empty? or .zero? It can also indicate a ternary operator and you use it to condense an if/else statement. Indicates that a boolean value is going to be returned.

#6. !! converts the element into a boolean value. You would use it if you want to the use the value of the element or convert the element to a boolean.

#Q3

advice.gsub!(/important/, "urgent") || advice.gsub!('important', 'urgent')

#Q4

numbers.delete_at(1) # this deletes the value at index 1 and returns it, so this will return 2

numbers.delete(1) # this will search the array and delete the values that matches the parameter and returns it.

# These methods are destructive.

#Q5

(10..100).cover? 42

#Q6

famous_words.insert(0, "Four score and ")

"Four score and ".concat(famous_words)

famous_words = "Four score and " + famous_words

famous_words.prepend("Four score and ")

"Four score and " << famous_words

#Q7

42

#Q8

flintstones.flatten!

#Q9

flintstones.to_a.values_at(2).flatten! || flintstones.assoc("Barney")

#Q10

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash_flint = {}
flintstones.each_with_index do |char, idx|
  hash_flint[char] = idx
end