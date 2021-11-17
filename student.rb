require_relative './person'

class Student < Person
  attr_accessor :classroom
  def initialize(classrom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classrom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classrom = classroom
    classroom.student.push(self) unless classroom.students.include?(self)
  end
end
