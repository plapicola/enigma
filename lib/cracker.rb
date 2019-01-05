require_relative 'enigma_cipher'

class Cracker

  attr_reader :date

  def initialize(date)
    @date = date
    @current_key = "00000"
    @cipher = EnigmaCipher.new
  end

  def next_key(key = @current_key)
    new_key = (key.to_i + 1).digits
    new_key << 0 until new_key.length == 5
    @current_key = new_key.reverse.join("")
  end

  def crack(phrase)

  end

end
