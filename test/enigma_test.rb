require_relative 'test_helper'
require 'date'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_encrypt_a_message_when_given_keys_and_dates
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_a_message_when_given_keys_and_dates
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_decrypting_an_encrypted_message_returns_the_original_message
    encrypted = @enigma.encrypt("hello world", "02715", "040895")

    actual = @enigma.decrypt(encrypted[:encryption], "02715", "040895")

    assert_equal "hello world", actual[:decryption]
  end

  def test_encrypting_a_message_with_no_given_key_generates_a_new_key
    encrypted = @enigma.encrypt("hello world", "040895")

    actual = @enigma.decrypt(encrypted[:encryption], encrypted[:key], "040895")

    assert_equal "hello world", actual[:decryption]
  end

  def test_encrypting__without_key_or_date_uses_random_key_and_current_date
    encrypted = @enigma.encrypt("hello world")
    message = encrypted[:encryption]
    key = encrypted[:key]
    date = encrypted[:date]
    todays_date = Date.today.strftime('%m%d%y')

    actual = @enigma.decrypt(message, key, date)

    assert_equal "hello world", actual[:decryption]
    assert_equal todays_date, encrypted[:date]
  end
end
