class Person
  attr_accessor :name, :age
  attr_reader :id

  def intialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.ran(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def is_of_age?
    @age >= 18
  end

  private:is_of_age?
end
