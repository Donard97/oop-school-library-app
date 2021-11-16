require './person.rb'

class Student > person
  def initialize(classrom,age, name = 'Unknown', parent_permission: true)
    @classrom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end