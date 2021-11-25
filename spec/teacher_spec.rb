require_relative '../teacher'

RSpec.describe Teacher do
  before :each do
    @teacher = Teacher.new('Maths', 45, 'paka')
  end
  it 'Takes three parameters and returns a Teacher object' do
    @teacher.should be_an_instance_of Teacher
  end

  it 'has a specialization' do
    @teacher.specialization.should eql 'Maths'
  end

  it 'Check for the age of the teacher' do
    @teacher.age.should eql 45
  end

  it 'Check for the name of the teacher' do
    @teacher.name.should eql 'paka'
  end

  it 'Can user services is always true' do
    @teacher.can_use_services?.should be_truthy
  end
end
