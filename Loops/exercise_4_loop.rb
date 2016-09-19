def countdown(num)
  if num == 0
    puts "#{num}"
    return
  else 
    puts "#{num}"
    countdown(num-1)
  end
end

countdown(gets.chomp.to_i)