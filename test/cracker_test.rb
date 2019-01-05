require_relative 'test_helper'

class CrackerTest < Minitest::Test

  def setup
    @cracker = Cracker.new("040895")
  end

  def test_it_exists
    assert_instance_of Cracker, @cracker
  end

  def test_it_has_a_date_value
    assert_equal "040895", @cracker.date
  end

  def test_it_can_crack_a_key
    assert_equal "02715", @cracker.crack("keder ohulwthnw")
  end

end