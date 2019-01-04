require_relative 'test_helper'

class CipherTest < Minitest::Test

  def setup
    @cipher = Cipher.new
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher
  end

  def test_it_can_translate_words_given_an_offset
    assert_equal "bcdef", @cipher.encode("abcde", 1)
  end

  def test_translated_words_can_contain_spaces
    assert_equal "ifmmpaxpsme", @cipher.encode("hello world", 1)
  end

  def test_encoded_words_are_translated_to_lower_case
    assert_equal "ifmmpaxpsme", @cipher.encode("HELLO WORLD", 1)
  end

  def test_only_alphabetical_and_whitespace_is_encoded
    assert_equal "ifmmpaxpsme?!", @cipher.encode("hello world?!", 1)
  end
end
