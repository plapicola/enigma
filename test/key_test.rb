require_relative 'test_helper'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new("02715")
  end

  def test_it_exists
    skip
    assert_instance_of Key, @key
  end

  def test_it_can_return_the_key_as_a_string
    skip
    assert_equal "02715", @key.key
  end

  def test_it_can_generate_a_random_key
    skip
    random_key = Key.random

    assert_instance_of Key, random_key
    assert_equal 5, random_key.length
  end

end
