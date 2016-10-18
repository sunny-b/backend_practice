require 'pry'

def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  sum_of_short_sides = sides.min(2).reduce(:+)
  longest_side = sides.max

  if (side1 == side2) && (side2 == side3)
    :equilateral
  elsif (side1 != side2) && (side2 != side3)
    :scalene
  elsif (sum_of_short_sides < longest_side) || sides.include?(0)
    :invalid
  else
    :isosceles
  end
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid