def after_midnight(time)
  hours_to_min = time[0..1].to_i * 60
  remaining_mins = time[-2..-1].to_i
  result = hours_to_min + remaining_mins
  return 0 if result == 1440
  result
end

def before_midnight(time)
  return 0 if after_midnight(time) == 0
  1440 - after_midnight(time)
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0

#further

def after_midnight2(time)
  time_arr = time.split(':').map(&:to_i)
  seconds_difference = Time.new(2016, 10, 6, time_arr.first, time_arr.last) -
                       Time.new(2016, 10, 6)
  mins_after = seconds_difference / 60
  return 0 if mins_after == 1440
  mins_after
end

def before_midnight2(time)
  mins_after = after_midnight2(time)
  return 0 if mins_after == 0
  1440 - mins_after
end                       


puts after_midnight2('00:00') == 0
puts before_midnight2('00:00') == 0
puts after_midnight2('12:34') == 754
puts before_midnight2('12:34') == 686
puts after_midnight2('24:00') == 0
puts before_midnight2('24:00') == 0