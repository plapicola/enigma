class Cipher

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def encode(word, offset)
    shifted_set = @character_set.rotate(offset)
    word.downcase.split("").map do |character|
      determine_character(character, shifted_set)
    end.join("")
  end

  def determine_character(character, shifted_set)
    if @character_set.include?(character)
      shifted_set[@character_set.index(character)]
    else
      character
    end
  end

  def decode(word, offset)
    Cipher.instance_method(:encode).bind(self).call(word, offset * -1)
    # encode(word, offset * -1)
  end

end
