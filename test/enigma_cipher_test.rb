require_relative 'test_helper'

class EnigmaCipherTest < Minitest::Test

  def setup
    @cipher = EnigmaCipher.new
  end

  def test_it_can_parse_keys
    # skip
    expected_1 = [2, 27, 71, 15]
    expected_2 = [0, 0, 1, 10]

    assert_equal expected_1, @cipher.parse_keys("02715")
    assert_equal expected_2, @cipher.parse_keys("00010")
  end

  def test_it_generate_offsets_from_date
    # skip
    expected = [1, 0, 2, 5]

    assert_equal expected, @cipher.generate_offsets("040895")
  end

  def test_it_can_generate_overall_shift
    skip
    expected = [3, 27, 73, 20]

    assert_equal expected, @cipher.generate_shifts("02715", "040895")
  end

  def test_it_can_encrypt_a_message
    skip
    expected = "keder ohulw"

    assert_equal expected, @cipher.encode("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_a_message
    skip
    expected = "hello world"

    assert_equal expected, @cipher.decode("keder ohulw", "02715", "040895")
  end

end
