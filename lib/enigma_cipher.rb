require_relative 'cipher'

class EnigmaCipher < Cipher

  def initialize
    super
  end

  def parse_keys(key)
    keys = key.split("").each_cons(2)
    keys.map {|key| key.join("").to_i}
  end

  def generate_offsets(date)
    squared_value = date.to_i * date.to_i
    (squared_value % 10000).digits.reverse
  end

end
