class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(student2)
    puts "Well done!" if grade < student2.grade
  end

  protected

  attr_reader :grade
end

joe = Student.new('joe', 'A')
bob = Student.new('bob', 'B')

joe.better_grade_than?(bob)
