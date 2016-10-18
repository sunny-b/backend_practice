def star(grid_size)
  blank_line = [' '] * grid_size
  midpoint = grid_size / 2
  top_half(midpoint, blank_line, grid_size)
  
  puts '*' * grid_size
  
  bottom_half(midpoint, blank_line, grid_size)
end

def top_half(midpoint, blank_line, grid_size)
  0.upto(midpoint - 1 ) do |num|
    stars = blank_line.clone
    stars[num],
    stars[midpoint],
    stars[(grid_size - 1) - num] = '*', '*', '*'
    
    puts stars.join
  end
end

def bottom_half(midpoint, blank_line, grid_size)
  (midpoint - 1).downto(0) do |num|
    stars = blank_line.clone
    stars[num],
    stars[midpoint],
    stars[(grid_size - 1) - num] = '*', '*', '*'
    
    puts stars.join
  end
end

star(19)

