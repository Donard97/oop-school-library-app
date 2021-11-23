require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def list_all_books
    puts 'There are no books registered! Please add books.' if @books.empty?
    @books.each { |book| puts book }
  end

  def list_all_people
    puts 'The are no people registered! Please add a student or teacher.' if @persons.empty?
    @persons.each { |person| puts person }
  end

  def list_rentals_by_person_id
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
  end
  
  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    @persons.push(Teacher.new(age, specialization, name))
  end

  def create_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp != 'n'

    @persons.push(Student.new(age, 'learn to code', name, parent_permission))
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = 0

    person_type = gets.chomp while person_type != '2' && person_type != '1'

    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    end

    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books.push(Book.new(title, author))

    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index} Title: #{book.title}, Author: #{book.author}" }
    selected_book = gets.chomp.to_i
    book = @books[selected_book]

puts 'Select a person from the following list by number'
    @persons.each_with_index do |person, index|
      splited_name = person.class.name.split('::').last
      puts "#{index} [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    selected_person = gets.chomp.to_i
    person = @persons[selected_person]

    print 'Date: '
    date = gets.chomp

    @rentals.push(Rental.new(date, person, book))
    puts 'Rental created successfully'
  end
end
