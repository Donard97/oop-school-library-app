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

  def run 
    print 'Welcome to School Library App'
    sleep 0.8
    menu
  end

  def menu
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    option = gets.chomp
    get_option option
  end
end