def factorial(n)
  if n == 1 # exit point 1
    1
  else
    a = factorial(n-1)
    b = n * a
  end
end

puts factorial(5)
puts factorial(10)