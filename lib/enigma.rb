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
    @key = key || KeyGenerator.random_number
    @date = date || todays_date
    @shifts = Shifts.new(@key, @date)
    {
      encryption: encrypted_message(@message, @shifts),
      key: @key,
      date: @date
                }
  end

  def encrypted_message(message, shifts)
    message.chars.map.with_index do |letter, index|
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

  def decrypt(encrypted_message, key=nil, date=nil)
    @encrypted_message = encrypted_message.downcase
    @key = key || KeyGenerator.random_number
    @date = date || todays_date
    @shifts = Shifts.new(@key, @date)
    {
      decryption: decrypted_message(@encrypted_message, @shifts),
      key: @key,
      date: @date
      }
  end

  def decrypted_message(encrypted_message, shifts)
    encrypted_message.chars.map.with_index do |letter, index|
      if @alphabet.index(letter).nil?
         letter
      else
        pre_shift_index = index % 4
        decryption_shift = -(shifts.shifts_sum.values[pre_shift_index])
        unshifted_index = (decryption_shift + @alphabet.index(letter)) % 27
        @alphabet[unshifted_index]
      end
    end.join
  end
end
