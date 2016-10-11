def dms(angle)
  if angle > 0
    degrees = angle.floor
    minutes = (angle % 1) * 60
    
  else
    degrees = angle.ceil
    minutes = -1 * (angle - degrees) * 60
  end
  seconds = (minutes % 1) * 60
    "#{format_angle(degrees)}˚"\
    "#{format_angle(minutes)}'"\
    "#{format_angle(seconds)}\""
end

def format_angle(angle)
  format('%02d', angle)
end

puts dms(30)
puts dms(76.73)
puts dms(254.6)
puts dms(93.034773)
puts dms(0)
puts dms(360)
puts dms(-76.73)