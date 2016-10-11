def calculate(num1, num2, op)
  puts "Can't perform calculation" if (op == '/' || op == '%') && num2.zero?
  "#{num1} #{op} #{num2} = #{num1.send(op, num2)}" 
end 
def prompt(msg)
  puts "=> #{msg}"
end

ops = %w(+ - * / % **)

prompt('Enter the first number:')
first_number = gets.chomp.to_i
prompt('Enter the second number')
second_number = gets.chomp.to_i

ops.each do |op|
  puts calculate(first_number, second_number, op)
end