require_relative 'enigma_cipher'
require_relative 'key'

class Cracker

  attr_reader :date,
              :key

  def initialize(date)
    @date = date
    @key = Key.new("00000")
    @cipher = EnigmaCipher.new
  end

  def crack(phrase)
    loop do
      attempt = @cipher.decode(phrase, @key, @date)
      break if attempt[-4..-1] == " end"
      @key.next_key
    end
  end

end
