require './lib/enigma.rb'
require './lib/key_generator.rb'


RSpec.describe KeyGenerator do
  before :each do
    @new_key = KeyGenerator.new
  end

  it 'exists' do
    expect(@new_key).to be_a(KeyGenerator)
  end

  it 'generates random keys' do
    expect(@new_key.random_key.length).to eq(5)
    expect(@new_key.random_key.class).to eq(String)
  end


end
