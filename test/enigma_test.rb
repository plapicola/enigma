require_relative 'test_helper'

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
end
