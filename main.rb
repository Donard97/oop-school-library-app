require './book.rb'
require './classroom.rb'
require './rental.rb'
require './person.rb'
require './student.rb'
require './teacher.rb'

class App
  def initialize 
    @people = []
    @books = []
    @rentals = []
    @class = Classroom.new('Grade 7')
  end
end