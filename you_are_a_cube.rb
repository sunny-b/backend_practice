def you_are_a_cube(cube)
  a = (cube**(1/3.0))
  if a%1.0 == 0 || a%1.0 > 0.9
    return true
  else
    return false
  end
end