class Classroom
  attr_accessor :label
  def initialize(label)
    @label = label
    @student = []
  end

  def add_student(student)
    @students.push(student)
  end
end