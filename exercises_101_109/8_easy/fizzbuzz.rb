def fizzbuzz(startnum, endnum)
  startnum.upto(endnum) do |num|
    if num % 3 == 0 && num % 5 == 0
      p 'FizzBuzz'
    elsif num % 5 == 0
      p 'Buzz'
    elsif num % 3 == 0
      p 'Fuzz'
    else
      p num
    end
  end
end

fizzbuzz(1, 15)