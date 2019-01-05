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

  def generate_shifts(key, date)
    keys = parse_keys(key)
    offsets = generate_offsets(date)
    keys.map.with_index do |key, index|
      key + offsets[index]
    end
  end

  def encode(word, key, date)
    shifts = generate_shifts(key, date)
    split_word = word.downcase.split("")
    grouped_letters = split_word.group_by.with_index do |letter, index|
      index % 4
    end
    grouped_letters.each do |key, letters|
      grouped_letters[key] = super(letters.join(""), shifts[key])
    end
    i = 0
    result = ""
    groups = grouped_letters.values
    while (i < word.length)
      result += groups[i % 4][i / 4]
      i += 1
    end
    result
  end

end
