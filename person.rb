# rubocop: disable Style/OptionalBooleanParameter
require_relative './corrector'

class Person
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end

  def of_age?
    @age >= 18
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  private :of_age?

  def can_use_services?
    of_age? || parent_permission == true
  end
end
# rubocop: enable Style/OptionalBooleanParameter
