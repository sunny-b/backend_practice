require 'date'

class Meetup
  attr_reader :month

  def initialize(month, year)
    @month = (Date.new(year, month)..Date.new(year, month, -1)).to_a
  end

  def day(day, schedule)
    day_symbol = day.to_s + '?'
    @days = month.select { |date| date.send(day_symbol) }

    self.send(schedule)
  end

  private

  def first
    @days.first
  end

  def second
    @days[1]
  end

  def third
    @days[2]
  end

  def fourth
    @days[3]
  end

  def last
    @days.last
  end

  def teenth
    @days.select { |date| (13..19).cover? date.day }.first
  end
end
