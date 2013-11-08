def sum_number(n)
  if n == 0 #exit point 0
    0
  else    
    a = sum_number(n-1) 
    b = n + a # => 6
    # 3 + sum_number(2)
    # 3 + (2 + sum_number(1))
    # 3 + (2 + (1 + sum_number(0)))
    # 3 + (2 + (1 + (0)))
  end
end

puts sum_number(3)