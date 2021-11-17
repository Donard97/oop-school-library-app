require_relative './corrector'

class Person
  attr_accessor :name, :age
  attr_reader :id, :rental

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def of_age?
    @age >= 18
  end

  def validate_name
    @name = @corrector.correct_name
  end

  private :of_age?

  def can_use_services?
    of_age? || parent_permission == true
  end
end

me = Person.new(14, 'donard')
p me.validate_name
