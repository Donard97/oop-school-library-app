# rubocop: disable Style/OptionalBooleanParameter
require_relative './person'

class Student < Person
  def initialize(age, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
# rubocop: enable Style/OptionalBooleanParameter
