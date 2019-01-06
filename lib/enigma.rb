require_relative 'enigma_cipher'
require_relative 'cracker'
require 'date'

class Enigma

  def initialize
    @character_set = ("a".."z").to_a << " "
    @cipher = EnigmaCipher.new
  end

  def encrypt(message, key = random_key, date = today)
    {key: key,
    date: date,
    encryption: @cipher.encode(message, key, date)}
  end

  def decrypt(message, key, date = today)
    {key: key,
    date: date,
    decryption: @cipher.decode(message, key, date)}
  end

  def crack(message, date = today)
    cracker = Cracker.new(date)
    cracker.crack(message)
    {date: date,
     key: cracker.key,
     decryption: @cipher.decode(message, cracker.key, date)}
  end

  def random_key
    key = ""
    5.times {key += Random.rand(10).to_s}
    key
  end

  def today
    Date.today.strftime('%m%d%y')
  end

end
