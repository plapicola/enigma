require_relative 'test_helper'

class EnigmaCipherTest < Minitest::Test

  def setup
    @mock_1 = mock("02715")
    @mock_2 = mock("00000")
    @mock_1.stubs(key: "02715", shifts: [3, 27, 73, 20])
    @mock_2.stubs(key: "00000", shifts: [0, 0, 0, 0])
    @cipher = EnigmaCipher.new
  end

  def test_it_can_shift_letters_in_a_word_given_shifts
    assert_equal "keder ohulw", @cipher.shift("hello world", [3, 27, 73, 20])
  end

  def test_it_can_encode_a_message
    # skip
    expected = "keder ohulw"

    assert_equal expected, @cipher.encode("hello world", @mock_1, "040895")
  end

  def test_it_can_decode_a_message
    # skip
    expected = "hello world"

    assert_equal expected, @cipher.decode("keder ohulw", @mock_1, "040895")
    assert_equal "test", @cipher.decode("test", @mock_2, "000000")
  end

end
