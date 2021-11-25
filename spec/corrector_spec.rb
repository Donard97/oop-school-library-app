require_relative '../corrector'

describe 'test for Corrector' do
  before :each do
    @corrector = Corrector.new
  end

  context '#correct_name' do
    it 'Check if name is changed to capitals' do
      name = @corrector.correct_name('donard')
      expect(name).to eq 'Donard'
    end

    it 'Reduce name to 10 characters' do
      name = @corrector.correct_name('donard')
      expect(name).to eq 'Donard'
    end
  end
end
