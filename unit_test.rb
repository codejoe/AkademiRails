require 'minitest/autorun'

def multi(number1, number2)
  number1 * number2
end

class Multi < MiniTest::Unit::TestCase
  def test_1
    assert_equal 12, multi(2,6)
  end
end