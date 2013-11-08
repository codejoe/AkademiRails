# require "minitest/autorun"

def pascal(baris, kolom)
  if baris == 0 || kolom == 0 || baris == kolom
    1
  else    
    result = pascal(baris-1, kolom-1) + pascal(baris-1, kolom)
  end
end

(0..4).each do |i|
  (0..i).each do |j|
    line = pascal(i,j)
    print ' ' 
    print line
  end
  print "\n"
end


# class MethodTesting < MiniTest::Unit::TestCase
#   def test_1
#     assert_equal 6, pascal(4,2)
#   end
# end

# 1
# 1 1
# 1 2 1
# 1 3 3 1
# 1 4 6 4 1

# f(b,k) = (b-1,k-1)+(b-1,k)

# (2,1) = 1,0 + 1,1
# b,k = b-1,k-1 + b-1,k

# 3 = x
# 4 = x + 1