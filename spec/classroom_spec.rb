require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Learn to code')
    @student = Student.new(age: 19, classroom: @classroom.label, name: 'Donard', parent_permission: true)
  end

  describe '#new' do
    it 'takes one parameter and returns a Classroom object' do
      expect(@classroom).to be_an_instance_of Classroom
    end
  end

  describe '#new' do
    it 'add student details to student array' do
      @classroom.add_student(@student)
      expect(@classroom.students).to include@student
    end
  end

  describe '#label' do
    it 'returns the correct label' do
      expect(@classroom.label).to eq 'Learn to code'
    end
  end
end
