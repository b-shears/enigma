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

  def encrypt(message, key=nil, date=nil)
    @message = message.downcase
    # require "pry"; binding.pry
    @key = key || KeyGenerator.random_number
    @date = date || todays_date
    @shifts = Shifts.new(@key, @date)
    encrypted_message(@message, @shifts)
    enrypt_output = {
                  encryption: encrypted_message(@message, @shifts),
                  key: @key,
                  date: @date
                }
  end

  def encrypted_message(message, shifts)
    message.chars.each_with_index.map do |letter, index|
      if @alphabet.index(letter).nil?
         letter
      else
        pre_shift_index = index % 4
        encryption_shift = shifts.shifts_sum.values[pre_shift_index]
        shifted_index = (encryption_shift + @alphabet.index(letter)) % 27
        @alphabet[shifted_index]
      end
    end.join
  end


  end
