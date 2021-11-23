# rubocop:disable Metrics/MethodLength
require_relative 'app'

def menu
  options = [
    '1 - List all books',
    '2 - List all people',
    '3 - Create a person',
    '4 - Create a book',
    '5 - Create a rental',
    '6 - List all rentals for a given person ID',
    '7 - Exit'
  ]
  puts
  puts 'Please choose an option by entering a number: '
  puts options
  puts
  gets.chomp.to_i
end

# rubocop:disable Metrics/CyclomaticComplexity
def get_option(library, choice)
  case choice
  when 1
    library.list_all_books
  when 2
    library.list_all_people
  when 3
    library.create_person
  when 4
    library.create_book
  when 5
    library.create_rental
  when 6
    library.list_rentals_by_person_id
  when 7
    puts 'Thank you for using this app!'
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength
def run
  library = App.new
  choice = 0
  until choice == 7
    choice = menu
    choice = menu while choice < 1 || choice > 7
    puts
    get_option(library, choice)
  end
end

def main
  puts 'Welcome to School Library App!'
  run
end

main
