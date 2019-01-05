class Enigma

  def initialize
    @character_set = ("a".."z").to_a << " "
    @cipher = EnigmaCipher.new
  end

  def encrypt(message, key, date)
    {key: key,
    date: date,
    encryption: @cipher.encode(message, key, date)}
  end


end
