require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require_relative 'app'

class Main
  include App

  def initialize
    @main_ans = 0
    @books = []
    @people = []

    puts 'Welcome to School Library App!'
    puts
  end

  def show_options
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person ID'
    puts '7 - Exit'
    print INPUT_MSG
  end

  # rubocop:disable Metrics
  def select_option
    case @main_ans
    when 1
      display_books
      enter_msg
    when 2
      display_people
      enter_msg
    when 3
      user_person_input
    when 4
      user_book_input
    when 5
      user_rental_input unless @books.empty? && @people.empty?
    when 6
      user_rental_id_input
    else
      if @main_ans != 7
        puts 'Invalid input, please try again'
        puts
      end
    end
  end

  # rubocop:enable Metrics

  def user_person_input
    decision = 0
    until [1, 2].include?(decision)
      puts 'Do you want to create a student (1), or a teacher (2)?'
      print INPUT_MSG
      decision = gets.chomp.to_i
      next if [1, 2].include?(decision)

      puts
      puts 'Invalid input, please try again'
      puts
    end
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    create_person(decision, age, name)
  end

  def user_book_input
    puts 'Please, enter book information below:'
    print 'Title:'
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    create_book(title, author)
  end

  def user_rental_input
    puts 'Select a book from the following list:'
    display_books
    print INPUT_MSG
    book_index = gets.chomp.to_i
    puts
    puts 'Select a person form the following list:'
    display_people
    print INPUT_MSG
    person_index = gets.chomp.to_i
    puts
    print 'Enter date of retrieval: '
    date = gets.chomp
    create_rental(book_index, person_index, date)
  end

  def user_rental_id_input
    loop do
      print 'Enter the person\'s ID: '
      display_people
      person_input = gets.chomp.to_i
      display_rentals(person_input)
      break if person_input
    end
  end

  def create_student_input(age, name)
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.upcase
    permission = permission != 'N'
    create_student(age, name, permission)
  end

  def create_teacher_input(age, name)
    print 'Specialty --> '
    specialty = gets.chomp
    create_teacher(age, name, specialty)
  end

  def main
    until @main_ans == 7
      show_options
      @main_ans = gets.chomp.to_i
      puts
      select_option
    end
    puts 'Exiting session'
    puts 'Thank you for using the Library School App!'
  end
end

Main.new.main
