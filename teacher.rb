# frozen_string_literal: true

require './person'

class Teacher < Person # rubocop:todo Style/Documentation
  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
