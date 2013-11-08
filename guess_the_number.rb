# guess the number

=begin
  
Apakah angkamu X?
: bigger
Apakah angkamu Y?
: smaller
Angkamu adalah Z

# PSEUDO CODE
def tebak
  while belum ketemu
    if bigger
      kurangi batas bawah
    elsif smaller
      kurangi batas atas
    elsif yes
      tampilkan
    end
  end
end  

def bigger_or_smaller(param, min, max)
min = 0
max = 100

nilai = max/2

  if param == 'bigger'
    puts 'Apakah angkamu 75?'   
    nilai = 75
    if param == 'bigger'
      puts 'nilai di atas 75'
    elsif param == 'smaller'
      puts 'nilai di bawah 75'
    end   
  elsif param == 'smaller'
    puts 'Apakah angkamu 25?'
    nilai = 25
  elsif param == 'yes'
    puts 'Jawaban benar'
  end
 end

puts 'Pikirkan angkamu. Aku akan menebaknya. 
Tekan enter untuk melanjutkan!'
gets

puts 'Apakah angkamu 50?'
bigger_or_smaller('', '','')

=end

min = 1
max = 100

tertebak = false

while !tertebak
  tebak = (min+max)/2
  puts "apakah angka kamu #{tebak}"
  input = gets.chomp

  if input == 'bigger'
    min = tebak
  elsif input == 'smaller'
    max = tebak
  elsif input  == 'yes'
    tertebak = true
  end
end

puts "angkamu #{tebak}"