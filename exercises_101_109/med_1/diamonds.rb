require 'pry'

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

def diamond_outline(grid_size)
  top_half(grid_size)
  bottom_half(grid_size)
end

def display_stars(left_edge, right_edge, blank_line)
  stars = blank_line.clone
  stars[left_edge], stars[right_edge] = '*', '*'
  puts stars.join('')
end

def top_half(grid_size)
  blank_line = [" "] * grid_size
  left_edge = grid_size / 2
  right_edge = left_edge
  while right_edge <= grid_size - 1
    display_stars(left_edge, right_edge, blank_line)
    left_edge -= 1
    right_edge += 1
  end
end

def bottom_half(grid_size)
  blank_line = [" "] * grid_size
  left_edge = 1
  right_edge = grid_size - 2
  while right_edge >= grid_size / 2
    display_stars(left_edge, right_edge, blank_line)
    left_edge += 1
    right_edge -= 1
  end
end

diamond_outline(1)
puts
diamond_outline(3)
puts
diamond_outline(9)


def diamond(size)
  puts '*'.center(size)
  (3...size).step(2) { |n| puts ('*' + ' ' * (n - 2) + '*').center(size) }

  (-size..-3).step(2) { |n| puts ('*' + ' ' * (-n - 2) + '*').center(size) }
  puts '*'.center(size)  
end
