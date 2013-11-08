require "minitest/autorun"

def first_method
  'hello ruby method!'  
end

def increment(number)
  number +1
end

def combine_numeric(number1,number2)
  number1 + number2
end

def combine_string(string1, string2)
  string1 + string2
end
# minitest
class MethodTesting < MiniTest::Unit::TestCase
  def test_1
    assert_instance_of String, first_method
  end
  def test_1_1
    first_method.must_be_instance_of String
  end
  def test_2
    assert_equal increment(10), 11
  end
  def test_3
    assert_equal combine_numeric(1,2), 3
  end
  def test_4
    assert_equal combine_string('nama saya ','naufal'), 'nama saya naufal'
  end
end