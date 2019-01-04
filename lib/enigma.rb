class Enigma

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key, date)

  end

  def parse_keys(key)
    keys = key.split("").each_cons(2)
    keys.map {|key| key.join("").to_i}
  end

end
