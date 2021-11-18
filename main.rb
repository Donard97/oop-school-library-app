# rubocop:disable Metrics

require './book'
require './classroom'
require './rental'
require './person'
require './student'
require './teacher'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
    @class = Classroom.new('Grade 7')
  end

  def run
    print 'Welcome to School Library App'
    sleep 0.65
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

  def get_option(input)
    case input
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_a_person
    when '4'
      create_a_book
    when '5'
      create_a_rental
    when '6'
      list_rentals_by_person_id
    when '7'
      puts 'Thank you for using our library'
    else
      puts 'Please enter a number between 1 and 7'
    end
  end

  def list_all_books
    puts 'There are no books registered! Please add books.' if @books.empty?
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    sleep 0.65
    menu
  end

  def list_all_people
    puts 'The are no people registered! Please add a student or teacher.' if @people.empty?
    @people.map { |person| puts "[#{person.class}] Name: #{person.name}, Id: #{person.id}, Age: #{person.age}, " }
    sleep 0.65
    menu
  end

  def create_a_person
    print 'Do you want to create a student (1) or teachet (2) [Input a number]: '
    option.gets.chomp

    case option
    when '1'
      create_a_student
    when '2'
      create_a_teacher
    else
      puts 'Invalid input. Please type 1 or 2'
    end
  end

  def create_a_student
    print 'Age'
    age = gets.chomp.to_i

    print 'Name'
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase

    student = Student.new(age, @class, name, parent_permission)
    @people << student

    puts 'Student create successfully'
    sleep 0.65
    menu
  end

  def create_a_teacher
    print 'Age'
    age = gets.chomp.to_i

    print 'Name'
    name = gets.chomp

    print 'Specialization'
    specialization = gets.chomp

    teacher = Teacher.new(specialization, age, name)
    @people << teacher

    puts 'Teacher create successfully'
    sleep 0.65
    menu
  end

  def create_a_book
    print 'Title'
    title = gets.chomp

    print 'Author'
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book added successfully'
    sleep 0.65
    menu
  end

  def create_a_rental
    puts 'Select a book frrom the following list by number'
    @books.each_with_index { |book, index| puts "#{index} Title: #{book.title}, Author: #{books.author}" }

    book_id = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index} [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_i

    rental = Rental.new(date, @people[person_id], @books[book_id])
    @rentals << rental

    puts 'Rental created successfully'
    sleep 0.65
    menu
  end

  def list_rentals_by_person_id
    print 'ID of person:'
    id = gets.chomps.to_i

    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title}, by #{rental.book.author}" if rental.person.id == id
    end
    sleep 0.65
    menu
  end

  def main
    app = App.new
    app.run
  end
end
# rubocop:enable Metrics
