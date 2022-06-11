class KeyGenerator

  # def initialize
  #   @argument = argument
  # end

  def self.random_key
    rand(5 ** 5).to_s.rjust(5, '0')
  end

end
