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

  def parse_keys
    keys = @key.split("").each_cons(2)
    keys.map {|key| key.join("").to_i}
  end

  def generate_offsets(date)
    offsets = ((date.to_i ** 2) % 10000).digits
    offsets << 0 until offsets.length == 4
    offsets.reverse
  end

end
