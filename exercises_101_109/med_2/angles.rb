def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  largest_angle = angles.max

  if angles.reduce(:+) != 180 || angles.include?(0)
    :invalid
  elsif largest_angle == 90
    :right
  elsif largest_angle > 90
    :obtuse
  else
    :acute
  end
end
      
puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid
