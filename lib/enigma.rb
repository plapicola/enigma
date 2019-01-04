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

  def generate_offsets(date)
    squared_value = date.to_i * date.to_i
    values = squared_value.to_s[-4..-1].split("").map do |number|
      number.to_i
    end
  end

end
