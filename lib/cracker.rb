require_relative 'enigma_cipher'

class Cracker

  attr_reader :date

  def initialize(date)
    @date = date
    @cipher = EnigmaCipher.new
  end

  def crack(phrase)

  end

end
