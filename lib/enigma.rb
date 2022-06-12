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

  def encrpyt

  end

end
