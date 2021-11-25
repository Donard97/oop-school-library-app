require_relative '../person'
require_relative '../corrector'

describe Person do
  before(:each) do
    @person = Person.new(24, 'Donard', true)
  end

  it 'is an instance of the class?' do
    expect(@person).to be_instance_of Person
  end

  it 'Check the name of the person' do
    expect(@person.name).to eq 'Donard'
  end

  it 'Check the age of the person' do
    expect(@person.age).to eq 24
  end

  it 'Check the can use services of the person' do
    expect(@person.can_use_services?).to be true
  end

  it 'Check the rentals of the person' do
    expect(@person).to have_attributes('rentals' => [])
  end
end
