def diamond(width)
  counter = 1
  while counter <= width
    puts ("*" * counter).center(width)
    break if counter >= width
    counter += 2
  end
  counter -= 2
  while counter >= 1
    puts ("*" * counter).center(width)
    counter -= 2
  end
end

diamond(1)
puts
diamond(3)
puts
diamond(9)