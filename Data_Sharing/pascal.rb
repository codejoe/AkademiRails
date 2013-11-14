require 'minitest/autorun'

def pascal(baris,kolom)

  if (kolom==0||kolom==baris)
    1
  else
    pascal(baris-1,kolom)+ pascal(baris-1,kolom-1)
  end 

end

(0..5).each do |i|

  (0..i).each do |j| 
    line=pascal(i,j)
    print " "
    print line 
  end
   print ("\n")
end 
 

class TestPascal <MiniTest::Unit::TestCase
  def test_1
    assert_equal 1, pascal(0,0)
    assert_equal 3, pascal(3,2)
    assert_equal 6, pascal(4,2)
    assert_equal 4, pascal(4,3)
    assert_equal 4, pascal(4,1)
  end
end