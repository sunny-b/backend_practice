class School
  def initialize
    @school = Hash.new([])
  end

  def add(name, grade)
    @school[grade] += [name]
  end

  def to_h
    @school.each { |grade, names| @school[grade] = names.sort }
    @school.sort_by { |grade, names| grade }.to_h
  end

  def grade(number)
    @school[number].sort
  end
end
