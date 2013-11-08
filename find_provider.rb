# find provider
def find_provider(number)
  number4digit = number[0..3]
  case number4digit
  when '0898','0899'
    number = 'Three'
  when '0857','0856'
    number = 'IM3'
  when '0811'
    number = 'Halo'
  when '0817'
    number = 'XL'
  else
    #
  end
end

puts find_provider('089823452545') == 'Three'
puts find_provider('085781757085') == 'IM3'
puts find_provider('081134253242') == 'Halo'
puts find_provider('081734432543') == 'XL'
puts find_provider('086789234324') == 'BYRU'