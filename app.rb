module App
  INPUT_MSG = 'Enter an option number here: '.freeze
  ENTER_MSG = 'Press ENTER to continue'.freeze

  def enter_msg
    print ENTER_MSG
    gets
    puts
  end

  def display_books
    puts 'List of books:'
    puts 'There is no book registered!' if @books.empty?
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
  end

  def display_people
    puts 'List of people:'
    puts 'There is no people registered!' if @people.empty?
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
  end

  def create_person(decision, age, name)
    case decision
    when 1
      create_student_input(age, name)
    else
      create_teacher_input(age, name)
    end
    puts
  end

  def create_book(title, author)
    @books << Book.new(title, author)
    puts
    puts 'Book created successfully'
    puts
  end

  def create_rental(book_index, person_index, date)
    Rental.new(date, @people[person_index], @books[book_index])
    puts 'Rental created successfully'
    puts
  end

  def display_rentals(person_input)
    renter = @people.select { |person| person.id == (person_input) }
    if renter.empty?
      puts 'No rentals found for this ID'
      user_rental_id_input
    else
      puts "Rentals of #{renter[0].name}:"
      puts 'There is no book rentered!' if renter[0].rentals.empty?
      renter[0].rentals.map { |rental| puts "Book: #{rental.book.title}, Rented on: #{rental.date}\n" }
      enter_msg
    end
  end

  private

  def create_student(age, name, permission)
    @people << Student.new(age, name, permission)
    puts 'Student created successfully'
    puts
  end

  def create_teacher(age, name, specialty)
    @people << Teacher.new(specialty, age, name)
    puts
    puts 'Teacher created successfully'
    puts
  end
end
