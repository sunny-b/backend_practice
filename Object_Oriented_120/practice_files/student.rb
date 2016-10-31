class Student
  def initialize(n, g)
    @name = n
    @grade = g
  end

  def better_grade_than?(name)
    self.grade > name.grade
  end

  protected

  def grade
    @grade
  end
end

bob = Student.new('Bob', 35)
joe = Student.new('Joe', 95)

puts "Well Done!" if joe.better_grade_than?(bob)