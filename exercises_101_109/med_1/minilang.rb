require 'pry'

OPTIONS = %w(add sub mult div mod pop)

def minilang(input)
  register = 0
  stack = []
  input_commands = input.downcase.split(' ')
  
  interpret_command(input_commands, register, stack)
end

def interpret_command(input_commands, register, stack)
  input_commands.map do |command|
    manipulate = false
    
    if OPTIONS.include?(command.downcase) || command.to_i.to_s == command
      manipulate = true
    end

    if manipulate
      register = change_register(register, stack, command)
    else
      case command
      when 'push'
        stack.push(register)
      when 'print'
        puts register
      end
    end
  end
end

def change_register(register, stack, command)
  case command
  when 'add'
   register + stack.pop
  when 'sub'
   register - stack.pop
  when 'mult'
    register * stack.pop
  when 'div'
   register / stack.pop
  when 'mod'
   register % stack.pop
  when 'pop'
    stack.pop
  else
   command.to_i
  end
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')

minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 5 PUSH 4 MULT ADD SUB DIV PRINT')






