require 'date'
require './lib/key_generator'
require './lib/shifts'

class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "

  end

  def todays_date
    Date.today.strftime("%d%m%y")
  end

  def encrypt(message, key, date)
    @key = KeyGenerator.random_number
    @shifts = Shifts.new(@key, todays_date)
    encrypted_message(message, @shifts)
  end

  def encrypted_message(message, shifts)
    message.chars.each_with_index.map do |letter, index|
      if @alphabet.index(letter).nil?
         letter
      else
        x = index % 4
        y = shifts.shifts_sum.values[x]
        z = (y + @alphabet.index(letter)) % 27
        @alphabet[z]
      end
    end.join
  end


  end
