MINS_IN_DAY = 1440
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day2(total_mins)
  sign = 1
  sign = -1 unless total_mins > 0
  mid_night = MINS_IN_DAY
  mid_night = 0 unless total_mins < 0

  if total_mins.abs > MINS_IN_DAY
    total_mins = (total_mins.abs % MINS_IN_DAY) * sign
  end

  time_in_mins = mid_night + total_mins
  time_hour = time_in_mins / 60
  time_min = time_in_mins % 60
  hour = convert_to_time(time_hour)
  minutes = convert_to_time(time_min)
  "#{hour}:#{minutes}"
end

def convert_to_time(num)
  num.to_s.rjust(2, '0')
end

def time_of_day(delta_minutes)
  days = 
  delta_minutes =  delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

puts "#{-3000 % 1440}"