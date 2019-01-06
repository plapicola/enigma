require_relative 'cipher'

class EnigmaCipher < Cipher

  def initialize
    super
  end

  def parse_keys(cipher_key)
    keys = cipher_key.split("").each_cons(2)
    keys.map {|key| key.join("").to_i}
  end

  def generate_offsets(date)
    squared_value = date.to_i * date.to_i
    offsets = (squared_value % 10000).digits
    offsets << 0 until offsets.length == 4
    offsets.reverse
  end

  def generate_shifts(cipher_key, date)
    keys = parse_keys(cipher_key)
    offsets = generate_offsets(date)
    keys.map.with_index do |key, index|
      key + offsets[index]
    end
  end

  def encode(word, key, date)
    shifts = generate_shifts(key, date)
    shift(word, shifts)
  end

  def shift(word, shifts)
    word.split("").map.with_index do |letter, index|
      super(letter, shifts[index % 4])
    end.join
  end

  def decode(word, key, date)
    shifts = generate_shifts(key, date)
    shifts = shifts.map {|amount| -amount}
    shift(word, shifts)
  end

  def group_letters_by_shift(word)
    split_word = word.downcase.split("")
    split_word.group_by.with_index do |letter, index|
      index % 4
    end
  end

  def reassemble_message(grouped_letters, message_size)
    result = ""
    message_size.times.with_index do |index|
      result += grouped_letters[index % 4][index / 4]
    end
    result
  end
end
