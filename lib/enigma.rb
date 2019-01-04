class Enigma

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key, date)
    keys = key.split("").each_cons(2)
    keys = keys.map {|key| key.join("").to_i}
  end

end
