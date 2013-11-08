# Guess the number recursion
def guess(min =1, max =100)
  
  tebak = (min+max)/2
  puts "apakah angka kamu #{tebak}"
  input = gets.chomp
  
  if input == 'bigger'
    guess(tebak, max) # change parameter min
  elsif input == 'smaller'
    guess(min, tebak) # change parameter max
  elsif input  == 'yes'
    puts "angkamu #{tebak}"
  end  
end

guess # call method