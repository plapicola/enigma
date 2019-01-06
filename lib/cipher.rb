class Cipher

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def shift(word, offset)
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

end
