class Key

  attr_reader :key

  def initialize(key)
    @key = key
  end

  def self.random
    key = ""
    5.times {key += Random.rand(10).to_s}
    self.new(key)
  end

  def next_key
    new_key = (key.to_i + 1).digits
    new_key << 0 until new_key.length == 5
    @key = new_key.reverse.join("")
  end

end
