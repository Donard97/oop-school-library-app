require_relative '../classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Learn to code')
  end

  describe '#new' do
    it 'takes one parameter and returns a Classroom object' do
      expect(@classroom).to be_an_instance_of Classroom
    end
  end

  describe '#label' do
    it 'returns the correct label' do
      expect(@classroom.label).to eq 'Learn to code'
    end
  end
end
