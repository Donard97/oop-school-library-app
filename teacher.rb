require './person.rb'

class Teacher > Person
  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    @specialization = specialization
  end
end