# Build a calculator that takes two numbers and an operation,
# and then displays the results.

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.nonzero?
end

def valid_operation?(num)
  (1..4).cover? num.to_i
end

def operation_to_message(op)
  case op
  when '1'
    ans = 'Adding'
  when '2'
    ans = 'Subtracting'
  when '3'
    ans = 'Multiplying'
  when '4'
    ans = 'Dividing'
  end
  return ans
end

def calculator(num1, num2, op)
  result = case op
           when '1'
             result = num1.to_i() + num2.to_i()
           when '2'
             result = num1.to_i() - num2.to_i()
           when '3'
             result = num1.to_i() * num2.to_i()
           when '4'
             result = num1.to_f() / num2.to_f()
           else
             prompt("The operation you put in could not be executed.")
           end
  prompt("Your result is #{result}")
end
num1 = nil
num2 = nil
operation = nil

prompt("Welcome to the Calculator! Enter your name:")
name = ""
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure you use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}")

loop do
  loop do
    prompt("Please give me a number: ")
    num1 = Kernel.gets().chomp()

    if valid_number?(num1)
      break
    else
      prompt("Error: Not a valid number")
    end
  end

  loop do
    prompt("Please give me another number: ")
    num2 = Kernel.gets().chomp()
    if valid_number?(num2)
      break
    else
      prompt("Error: Not a valid number")
    end
  end

  operator_prompt = <<-MSG
  What operation would you like to perform?
  1.) add
  2.) subtract
  3.) multiply
  4.) divide
  MSG

  prompt(operator_prompt)

  loop do
    operation = Kernel.gets().chomp()
    if valid_operation?(operation)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end
  prompt("#{operation_to_message(operation)} #{num1} and #{num2}...")
  calculator(num1, num2, operation)
  Kernel.puts()
  prompt("Would you like to calculate again? (Y/N)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
  Kernel.puts()
end

prompt('Thank you for using this calculator')
