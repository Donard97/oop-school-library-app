require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe Rental do
  describe '#new' do
    book = Book.new('Think Again', 'Adam Grant')
    person = Person.new(name: 'Donard', age: 24, parent_permission: false)
    rental = Rental.new('11/24/2021', person, book)
    it 'returns a Rental object' do
      expect(rental).to be_an_instance_of Rental
    end
    it 'should set the correct book' do
      expect(rental.book).to eq book
    end
    it 'should set the correct person' do
      expect(rental.person).to eq person
    end
    it 'should set the correct date' do
      expect(rental.date).to eq '11/24/2021'
    end
    it 'should contain a new rental in person' do
      expect(person.rentals).to include(rental)
    end
    it 'should contain a new rental in book' do
      expect(book.rentals).to include(rental)
    end
  end
end
