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

end
