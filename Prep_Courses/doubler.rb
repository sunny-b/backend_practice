def doubler(start)
  start = start * 2
  puts start
  if start < 100000000000000
    doubler(start)
  end
end

doubler(1)