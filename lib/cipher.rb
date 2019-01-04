class Cipher

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def encode(word, offset)
    characters = word.split("")
    shifted_set = @character_set.rotate(offset)
    characters.map do |character|
      if @character_set.include?(character)
        shifted_set[@character_set.index(character)]
      else
        character
      end
    end.join("")
  end

end
