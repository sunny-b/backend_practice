def print_in_box(str)
  width = str.length
  second_str = nil
  wrap = false
  if width > 76
    wrap = true
    second_str = str[76..width-1]
    str = str[0...76]
    width = str.length
  end
  full_line = '+' + ('-' * (width + 2)) + '+'
  empty_line = '|' + (' ' * (width + 2)) + '|'

  puts full_line
  puts empty_line
  puts '| ' + str + ' |'
  puts '| ' + second_str.center(76) + ' |' if wrap
  puts empty_line
  puts full_line
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('To infinity and beyond you sucker bitch, you can\'t handle the truth because you\'s a sucka ahha. I like Kanye, he aight. Strong ghetto music')
print_in_box('')