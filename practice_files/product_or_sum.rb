require 'pry'

def output_sum(number)
  sum = 0
  1.upto(number) { |value| sum += value }
  puts "The sum of numbers from 1 to #{number} is #{sum}"
end

def out_product(number)
  product = 1
  1.upto(number) { |value| product *= value }
  puts "The product of numbers from 1 to #{number} is #{product}"
end

puts "Please enter an number greater than 5:"
number = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product:"
answer = gets.chomp.downcase

if answer == 's'
  output_sum(number)
elsif answer == 'p'
  output_product(number)
else
  puts "Invalid command"
end
