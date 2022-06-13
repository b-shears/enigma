require 'spec_helper'
require './lib/enigma'
require './lib/key_generator'

RSpec.describe KeyGenerator do
  before :each do
    @new_key = KeyGenerator.new
  end

  it 'exists' do
    expect(@new_key).to be_a(KeyGenerator)
  end

  it 'generates random keys' do
    expect(KeyGenerator.random_key.length).to eq(5)
    expect(KeyGenerator.random_key.class).to eq(String)
  end
end
