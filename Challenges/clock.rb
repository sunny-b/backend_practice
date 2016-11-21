=begin
create a clock that takes two inputs, hour and minute.
These are set to 0 as default. You can add and subtract minutes to clock.
also, if two clocks have the same time, they are equal.
=end

class Clock
  attr_accessor :hour, :min

  def initialize(hour = 0, min = 0)
    @hour = hour
    @min = min
  end

  class << Clock
    alias_method :at, :new
  end

  def to_s
    format("%02d:%02d", hour, min)
  end

  def ==(other_time)
    self.to_s == other_time.to_s
  end

  def +(number)
    self.min += number % 60
    self.hour += (number / 60)
    self.hour %= 24
    self
  end

  def -(number)
    self.min -= number
    self.min %= 60
    self.hour -= (number / 60.0).ceil
    self.hour %= 24
    self
  end
end

clock = Clock.at(8) + 3
clock.to_s
