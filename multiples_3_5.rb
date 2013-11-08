# Multiple 3 and 5 below 1000


def multiple(param1 = 3, param2)
=begin
  max = 1000
  while param1 < max do
    puts  param1
    param1 +=3   
  end
  while param2 < max do
    puts  param2  
    param2 +=5   
  end
=end

  #a = *(1...1000)
  a = *(1..10)
  select = a.select { |x| x%param1 == 0 || x%param2 == 0 }
  inject = select.inject { |sum, e| sum +=e  }

  puts inject
end

multiple(5)