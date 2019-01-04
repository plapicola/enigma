require_relative 'test_helper'

class CipherTest < Minitest::Test

  def setup
    @cipher = Cipher.new
  end

  def test_it_exists
    # skip
    assert_instance_of Cipher, @cipher
  end

  def test_it_can_translate_words_given_an_offset
    # skip
    assert_equal "bcdef", @cipher.encode("abcde", 1)
  end

  def test_translated_words_can_contain_spaces
    # skip
    assert_equal "ifmmpaxpsme", @cipher.encode("hello world", 1)
  end

  def test_encoded_words_are_translated_to_lower_case
    # skip
    assert_equal "ifmmpaxpsme", @cipher.encode("HELLO WORLD", 1)
  end

  def test_only_alphabetical_and_whitespace_is_encoded
    skip
    assert_equal "ifmmpaxpsme?!", @cipher.encode("hello world?!", 1)
  end

  def test_it_can_decode_words_using_an_offset
    skip
    assert_equal "hello world?!", @cipher.encode("ifmmpaxpsme?!", 1)
  end
end
