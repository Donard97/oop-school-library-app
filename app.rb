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
