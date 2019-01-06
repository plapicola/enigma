require_relative 'cipher'

class EnigmaCipher < Cipher

  def initialize
    super
  end

  def encode(word, key, date)
    shift(word, key.generate_shifts(date))
  end

  def shift(word, shifts)
    word.split("").map.with_index do |letter, index|
      super(letter, shifts[index % 4])
    end.join
  end

  def decode(word, key, date)
    shifts = key.generate_shifts(date).map {|amount| -amount}
    shift(word, shifts)
  end
end
