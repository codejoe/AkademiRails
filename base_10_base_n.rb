# Base 10 to Base N
# require "minitest/autorun"

def converttobase(number, basis, result="")
  array = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z ! @ # $ % ^ & * ( ) _ + - = { } [ ] < > ? ~)
  #result = ""
  if number > 0
    modulus = number % basis
    #       = 5 % 2
    result += array[modulus] 
    #       = "" + 1   
    number = number / basis
    #       = 5 / 2
    converttobase(number,basis,result) 
  else   
    result.reverse
  end
end

puts converttobase(9,4)

# class MethodTesting < MiniTest::Unit::TestCase
# 	def test_1
# 		assert_equal '21',converttobase(9,4) 
# 	end
# end

#puts converttobase(9,2)
#puts converttobase(9,2) == '1001'
# puts converttobase(9,4) == '21'
# puts converttobase(12,16) == 'c'
# puts converttobase(255,2) == '11111111'
# puts converttobase(255,5) == '2010'
# puts converttobase(255,20) == 'cf'