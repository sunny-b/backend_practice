#Q1

#A string printed 10 times with a one space indent everytime. Has to be one line.
10.times { |number| puts (" " * number) + "The Flintstones Rock!"

#Q2

statement = "The Flintstones Rock"
statement_hash = {}

statement.each_char do |char|
  next if char == " "
  statement_hash[char] = statement.scan(char).count
end

# output => {"T"=>1, "h"=>1, "e"=>2, "F"=>1, "l"=>1, "i"=>1, "n"=>2, "t"=>2, "s"=>2, "o"=>2, "R"=>1, "c"=>1, "k"=>1}

or 

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_freq = statement.scan(letter).count
  result[letter] = letter_freq if letter_freq > 0
end

#Q3

#It will be an error because a string can't be added to a number

puts "the value of 40 + 2 is #{40 + 2}"

puts "the value of 40 + 2 is " + (40 + 2).to_s

#Q4

#The array output will skip a number because the index numbers change

1
3

1
2

#The iterators work on the array in real time and do not keep a copy of the original, so we need to keep that in mind and avoid modidying arrays in blocks.

#Q5

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number/dividend if number%dividend == 0
    dividend -= 1
  end
  divisors
end

# The purpose of number % dividend is to verify if number divided by dividend causes any remainder.
# Since divisors is the last line of the method, it will be the return value, so this method is returning divisors as an array.

#Q6

# The difference between << and + is that << mutates the caller and permanently changes the inputed "buffer". 
# "+" creates a new array and doesn't modify "input_array", so the inputed array will not be impacted.
# If you don't want to keep older versions of the array hanging around, then << is better because it mutates the caller.
# If you use the latter method, you will need to keep reassigning buffers.


#Q7

# Because the "limit" variable was initiated on the outside of the method, the method doesn't have access to it
# It will throw a error saying uninitiated local variable.

def fib(first_num, second_num)
  limit = 15
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

or 

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end 

#Q8

string = "capitalize every single word in this string, just like in titleize"

string = string.split(" ").each{ |word| word.capitalize }.join(" ")

p string

#Q9

def age_group(age)
  group =  case
           when (0..17).include?(age)
             "kid"
           when (18..64).include?(age)
             "adult"
          when age > 64
            "senior"
          end
  group
end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |_, value|
  value["age_group"] = age_group(value['age'])
end

or

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

