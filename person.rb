class Person
attr_accessor :name, :age
attr_reader :id
def intialize(name = 'Unknown', age, parent_permission:true)
  @id = Random.ran(1..1000)
  @name = name
  @age = age
  @parent_permission = parent_permission
end
end