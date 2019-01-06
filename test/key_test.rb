require_relative 'test_helper'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new("02715")
  end

  def test_it_exists
    skip
    assert_instance_of Key, @key
  end

end
