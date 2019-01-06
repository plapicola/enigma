require_relative 'enigma_cipher'

class Cracker

  attr_reader :date,
              :key

  def initialize(date)
    @date = date
    @key = "00000"
    @cipher = EnigmaCipher.new
  end

  def next_key(key = @key)
    new_key = (key.to_i + 1).digits
    new_key << 0 until new_key.length == 5
    @key = new_key.reverse.join("")
  end

  def crack(phrase)
    loop do
      attempt = @cipher.decode(phrase, @key, @date)
      break if attempt[-4..-1] == " end"
      next_key
    end
  end

end
