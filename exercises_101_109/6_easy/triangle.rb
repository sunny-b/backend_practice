def triangle(size)
  size.times { |num| puts ('*' * (num + 1)).ljust(size) }
end

def triangle2(size)
  counter = size
  while counter > 0
    puts ("*" * counter).ljust(size)
    counter -= 1
  end
end

triangle2(10)