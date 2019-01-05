require_relative 'test_helper'
require 'date'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    # skip
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_generate_a_key
    # skip
    key = @enigma.random_key

    assert_instance_of String, key
    assert_equal 5, key.length
    refute_equal 0, key.to_i
  end

  def test_it_can_determine_todays_date
    todays_date = Date.today.strftime('%m%d%y')

    assert_equal todays_date, @enigma.today
  end

  def test_it_can_encrypt_a_message_when_given_keys_and_dates
    # skip
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_a_message_when_given_keys_and_dates
    # skip
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_decrypting_an_encrypted_message_returns_the_original_message
    # skip
    encrypted = @enigma.encrypt("hello world", "02715", "040895")

    actual = @enigma.decrypt(encrypted[:encryption], "02715", "040895")

    assert_equal "hello world", actual[:decryption]
  end

  def test_encrypting_a_message_with_no_given_date_uses_todays_date
    # skip
    encrypted = @enigma.encrypt("hello world", "02715")

    actual = @enigma.decrypt(encrypted[:encryption], "02715", encrypted[:date])

    assert_equal "hello world", actual[:decryption]
  end

  def test_encrypting__without_key_or_date_uses_random_key_and_current_date
    # skip
    encrypted = @enigma.encrypt("hello world")
    message = encrypted[:encryption]
    key = encrypted[:key]
    date = encrypted[:date]
    todays_date = Date.today.strftime('%m%d%y')

    actual = @enigma.decrypt(message, key, date)

    assert_equal "hello world", actual[:decryption]
    assert_equal todays_date, encrypted[:date]
  end

  def test_decrypting_a_message_with_no_given_date_uses_todays_date
    # skip
    encrypted = @enigma.encrypt("hello world")

    actual = @enigma.decrypt(encrypted[:encryption], encrypted[:key])

    assert_equal "hello world", actual[:decryption]
  end
end
