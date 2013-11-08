require "minitest/autorun"

def fibonacci(index)
  #index <= 1 ? index : c = fibonacci(index-1) + fibonacci(index-2)
  if index <= 1
    index
  else
    c = fibonacci(index-1) + fibonacci(index-2)
    # fibonacci 3 = fibonacci a + fibonacci b
  end
end

class MethodTesting < MiniTest::Unit::TestCase
	def test_1
		assert_equal fibonacci(1), 1
	end
	def test_2
		assert_equal fibonacci(5), 5
	end
	def test_3
		assert_equal fibonacci(6), 8
	end
end


# 0, 1, 1, 2, 3, 5, 8, 13, 21
#fibonacci 3 
#c = fibonacci(2) + fibonacci(1)
#fibonacci 2
#c = fibonacci(1) + fibonacci(0)
#fibonacci 1
#c = fibonacci(0) + fibonacci(-1)