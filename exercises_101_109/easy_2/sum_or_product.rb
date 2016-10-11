def prompt(msg)
  puts "=> #{msg}"
end

prompt('Please enter an integer greater than 0:')
int = gets.chomp.to_i
prompt("Enter 's' to compute the sum,"\
       " 'p' to compute the product.")
answer = gets.chomp.downcase

sum_product = nil
op = nil
if answer == 's'
  sum_product = (1..int).to_a.inject(:+)
  op = 'sum'
else
  sum_product= (1..int).to_a.inject(:*)
  op = 'product'
end

prompt("The #{op} of the integers between 1 and #{int} is #{sum_product}")
