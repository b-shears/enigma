class KeyGenerator
  def self.random_number
    rand(5 ** 5).to_s.rjust(5, '0')
  end
end
