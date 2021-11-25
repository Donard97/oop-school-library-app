require_relative '../corrector'
describe Corrector do
  before :each do
    @corrector = Corrector.new
  end
  describe '#new' do
    it 'takes one parameter and returns a Corrector object' do
      expect(@corrector).to be_an_instance_of Corrector
    end
  end
  describe '#correct_name' do
    it 'returns a capitalized name' do
      expect(@corrector.correct_name('Donard')).to eq 'donard'
    end
  end
end
