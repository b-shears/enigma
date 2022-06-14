require 'date'
require './lib/key_generator'
require './lib/shifts'

class Enigma
  ALPHABET = ("a".."z").to_a << " "

  def todays_date
    Date.today.strftime("%d%m%y")
  end

  def encrypt(message, key = KeyGenerator.random_number, date = todays_date)
    message = message.downcase
    shifts = Shifts.new(key, date)
    {
      encryption: encrypted_message(message, shifts),
      key: key,
      date: date
                }
  end

  def encrypted_message(message, shifts)
    message.downcase.chars.map.with_index do |letter, index|
      if ALPHABET.index(letter).nil?
         letter
      else
        pre_shift_index = index % 4
        encryption_shift = shifts.shifts_sum.values[pre_shift_index]
        shifted_index = (encryption_shift + ALPHABET.index(letter)) % 27
        ALPHABET[shifted_index]
      end
    end.join
  end

  def decrypt(encrypted_message, key = KeyGenerator.random_number, date = todays_date)
    encrypted_message = encrypted_message.downcase
    shifts = Shifts.new(key, date)
    {
      decryption: decrypted_message(encrypted_message, shifts),
      key: key,
      date: date
      }
  end

  def decrypted_message(encrypted_message, shifts)
    encrypted_message.downcase.chars.map.with_index do |letter, index|
      if ALPHABET.index(letter).nil?
         letter
      else
        pre_shift_index = index % 4
        decryption_shift = -(shifts.shifts_sum.values[pre_shift_index])
        unshifted_index = (decryption_shift + ALPHABET.index(letter)) % 27
        ALPHABET[unshifted_index]
      end
    end.join
  end
end
