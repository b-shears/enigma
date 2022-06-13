require 'spec_helper'
require 'date'
require './lib/shifts'
require './lib/key_generator'
require './lib/enigma'


RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
    # @encrypted = @enigma.encrypt("hello world", "02715")
    # @enigma.decrypt(encrypted[:encryption], "02715")
    # @enigma.encrypt("hello world")
  end

  it 'exists' do
    expect(@enigma).to be_a(Enigma)
  end

  it 'returns the current date' do
    expect(@enigma.todays_date.length).to eq(6)
    expect(@enigma.todays_date.class).to eq(String)
  end

  it 'can encrypt a message with a key and date' do
    @message = "hello world!"
    expect(@enigma.encrypt(@message, "02715", "040895")).to eq({
       encryption: "keder ohulw!",
       key: "02715",
       date: "040895"
      })
  end

  it 'can encrypt the message by shifting the letters' do
    @shifts = Shifts.new("02715", "040895")
    @message = "hello world!"
    expect(@enigma.encrypted_message(@message, @shifts)).to eq("keder ohulw!")
  end

  it 'can decrypt a message with a key and a date' do
    expect(@engima.decrypt("keder ohulw", "02715", "040895")).to eq({decryption: "hello world",
      key: "02715",
      date: "040895"
      })
    end

  it 'can encrypt the message by shifting the letters' do
      @shifts = Shifts.new("02715", "040895")
      @message = "keder ohulw!"
      expect(@enigma.decrypted_message(@message, @shifts)).to eq("hello world!")
  end

end
