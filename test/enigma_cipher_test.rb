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
    zeroes = [0, 0, 0, 0]

    assert_equal expected, @cipher.generate_offsets("040895")
    assert_equal zeroes, @cipher.generate_offsets("010100")
  end

  def test_it_can_generate_overall_shift
    # skip
    expected = [3, 27, 73, 20]

    assert_equal expected, @cipher.generate_shifts("02715", "040895")
  end

  def test_it_can_encrypt_a_message
    # skip
    expected = "keder ohulw"

    assert_equal expected, @cipher.encode("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_a_message
    # skip
    expected = "hello world"

    assert_equal expected, @cipher.decode("keder ohulw", "02715", "040895")
    assert_equal "test", @cipher.decode("test", "00000", "000000")
  end

  def test_it_can_group_letters_by_cipher_shift
    # skip
    expected = {0 => ["h","o","r"],
                1 => ["e"," ","l"],
                2 => ["l", "w", "d"],
                3 => ["l", "o"]}

    assert_equal expected, @cipher.group_letters_by_shift("hello world")
  end

  def test_it_can_reassemble_a_grouping_of_letters
    # skip
    grouping = {0 => ["h","o","r"],
                1 => ["e"," ","l"],
                2 => ["l", "w", "d"],
                3 => ["l", "o"]}

    assert_equal "hello world", @cipher.reassemble_message(grouping, 11)
  end

end
