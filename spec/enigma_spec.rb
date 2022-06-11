require './lib/enigma.rb'


RSpec.describe Enigma do
  before :each do
    @engima = Enigma.new
  end

  it 'exists' do
  expect(@engima).to be_a(Enigma)
  end 
end
