require 'json'
require_relative '../person'
require_relative '../book'
require_relative '../rental'
require_relative '../teacher'
require_relative '../student'

describe 'Book' do
  before :each do
    @book = Book.new('Think Again', 'Donard')
  end

  describe '#new' do
    it 'should return a new book object' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe '#title' do
    it 'should return the book title' do
      expect(@book.title).to eql 'Think Again'
    end
  end

  describe '#author' do
    it 'should return the book author' do
      expect(@book.author).to eql 'Donard'
    end
  end

  describe '#rentals' do
    it 'returns a has-many Rental relationship' do
      expect(@book).to have_attributes('rentals' => [])
    end
  end
end
