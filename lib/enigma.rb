require_relative 'enigma_cipher'
require_relative 'cracker'
require_relative 'key'
require 'date'

class Enigma

  def initialize
    @character_set = ("a".."z").to_a << " "
    @cipher = EnigmaCipher.new
  end

  def encrypt(message, key = nil, date = today)
    key = make_key(key)
    {key: key.key,
    date: date,
    encryption: @cipher.encode(message, key, date)}
  end

  def decrypt(message, key, date = today)
    key = make_key(key)
    {key: key.key,
    date: date,
    decryption: @cipher.decode(message, key, date)}
  end

  def crack(message, date = today)
    cracker = Cracker.new(date)
    cracker.crack(message)
    {date: date,
     key: cracker.key.key,
     decryption: @cipher.decode(message, cracker.key, date)}
  end

  def make_key(value)
    return Key.new(value) if value
    Key.random
  end

  def today
    Date.today.strftime('%m%d%y')
  end

end
