require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('Learn to code')
    @student = Student.new(age: 30, classroom: @classroom.label, name: 'Paka', parent_permission: false)
  end

  it ' show instance of classroom class' do
    expect(@classroom).to be_instance_of Classroom
  end

  it 'add student details to student array' do
    @classroom.add_student(@student)
    expect(@classroom.students).to include @student
  end

  it 'returns the correct label' do
    expect(@classroom.label).to eq 'Learn to code'
  end

  it 'checks the size of students array' do
    @student1 = Student.new(age: 24, classroom: @classroom.label, name: 'Donard', parent_permission: true)
    @classroom.add_student(@student)
    @classroom.add_student(@student1)
    expect(@classroom.students.size).to be 2
  end
end
