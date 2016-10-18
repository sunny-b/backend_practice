def egyptian(rat_num)
  counter = 1
  denominators = []

  while rat_num > 0
    if rat_num.numerator == 1 &&
       !denominators.include?(rat_num.denominator)
      denominators << rat_num.denominator
      break
    elsif rat_num - Rational(1, counter) > 0
      denominators << counter
      rat_num -= Rational(1, counter)
    end
    counter += 1
  end

  denominators
end

def unegyptian(array)
  array.reduce(0) { |sum, num| sum + Rational(1, num) }
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
