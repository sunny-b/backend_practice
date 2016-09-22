# Build a calculator that takes two numbers and an operation,
# and then displays the results.
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')


def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num =~ /[[:digit:]]/
end

def valid_operation?(num)
  (1..4).cover? num.to_i
end

def operation_to_message(op)
  ans = case op
          when '1'
            'Adding'
          when '2'
            'Subtracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
        end
  return ans
end

def calculator(num1, num2, op)
  result = case op
           when '1'
             result = num1.to_f() + num2.to_f()
           when '2'
             result = num1.to_f() - num2.to_f()
           when '3'
             result = num1.to_f() * num2.to_f()
           when '4'
             result = num1.to_f() / num2.to_f()
           end
  prompt("Your result is #{result}")
end
num1 = nil
num2 = nil
operation = nil

prompt(MESSAGES['welcome'])
name = ""
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}")

loop do
  loop do
    prompt(MESSAGES['give_num'])
    num1 = Kernel.gets().chomp()

    if valid_number?(num1)
      break
    else
      prompt(MESSAGES['error_num'])
    end
  end

  loop do
    prompt(MESSAGES['another_num'])
    num2 = Kernel.gets().chomp()
    if valid_number?(num2)
      break
    else
      prompt(MESSAGES['error_num'])
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
      prompt(MESSAGES['error_op'])
    end
  end
  prompt("#{operation_to_message(operation)} #{num1} and #{num2}...")
  calculator(num1, num2, operation)
  Kernel.puts()
  prompt(MESSAGES['again'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
  Kernel.puts()
end

prompt(MESSAGES['thanks'])
