require_relative 'test_helper'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new("02715")
  end

  def test_it_exists
    # skip
    assert_instance_of Key, @key
  end

  def test_it_can_return_the_key_as_a_string
    # skip
    assert_equal "02715", @key.key
  end

  def test_it_can_generate_a_random_key
    # skip
    random_key = Key.random

    assert_instance_of Key, random_key
    assert_equal 5, random_key.key.length
  end

  def test_it_can_return_the_next_sequential_key
    # skip
    assert_equal "02716", @key.next_key
    assert_equal "02717", @key.next_key
  end

  def test_it_can_return_the_array_of_keys
    # skip
    assert_equal [2, 27, 71, 15], @key.parse_keys
  end

  def test_it_can_generate_date_offsets
    # skip
    assert_equal [1, 0, 2, 5], @key.generate_offsets("040895")
  end

  def test_it_can_return_shifts_if_given_a_date
    # skip
    assert_equal [3, 27, 73, 20], @key.shifts("040895")
  end

end
