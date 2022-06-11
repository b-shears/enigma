require 'date'
require './lib/enigma.rb'


RSpec.describe Enigma do
  before :each do
    @engima = Enigma.new
    @encrypted = enigma.encrypt("hello world", "02715")
    @enigma.decrypt(encrypted[:encryption], "02715")
    @enigma.encrypt("hello world")
  end

  it 'exists' do
  expect(@engima).to be_a(Enigma)
  end

  it 'can encrypt a message with a key and date' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq({
       encryption: "keder ohulw",
       key: "02715",
       date: "040895"
      }))
  end

  it 'can decrypt a message with a key and a date' do
    expect(@engima.decrypt("keder ohulw", "02715", "040895")).to eq({decryption: "hello world",
      key: "02715",
      date: "040895"
      })

    # it 'can encrypt a message with a key (uses todays date)' do
    #   expect()
    end
end
