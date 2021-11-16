# frozen_string_literal: true

require './person'

class Student < Person # rubocop:todo Style/Documentation
  def initialize(_classrom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classrom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
