require 'matrix'
class Soal
  def initialize#(soal)
    @soal = '619.3..4.27..61..8....476214863.2.79....1458..31..9.6...572.8.632.1.6.5716.4...3.'#soal
    #@soal ='.3.647.8.7.9...2.6.1.9.3.4.3.1.7.8.48..3.4..24.2.5.6.3.8.5.1.2.1.3...4.9.2.439.6.'
    # ??@soal ='..53.4.........86..4...675..9...14..51..2..76..68...9..591...2..67.........6.51..'
    # ??@soal = '...84...9..1.....58...2146.7.8....9...........5....3.1.2491...79.....5..3...84...'
    # ??@soal = '9..46......72......34.792..79...85..3.6...8.9..59...32..963.48......43......85..7'
    # ??@soal = '3.......9.7..4..3...61.35....7.3.8...8.2.4.1...5.7.6....23.74...1..6..2.8.......7'
    @temp_soal = []
    self.soal  
  end
  def read_soal
    @iterasi_0
  end
  def load_soal
    row_string = 0
    0.upto(8) do |baris|
      0.upto(8) do |kolom|
        if !( @soal[row_string,1] == ".")
          @iterasi_0[baris][kolom]=@soal[row_string,1].to_i
        else
          @iterasi_0[baris][kolom]=0
          temp_soal(baris,kolom)
        end
        row_string += 1
      end
    end
  end
  def soal
    @iterasi_0 = 
    {
      0 => [1,2,3,4,5,6,7,8,9],
      1 => [1,2,3,4,5,6,7,8,9],
      2 => [1,2,3,4,5,6,7,8,9],
      3 => [1,2,3,4,5,6,7,8,9],
      4 => [1,2,3,4,5,6,7,8,9],
      5 => [1,2,3,4,5,6,7,8,9],
      6 => [1,2,3,4,5,6,7,8,9],
      7 => [1,2,3,4,5,6,7,8,9],
      8 => [1,2,3,4,5,6,7,8,9]
    }
  end
  def matrix
    @matrix = Matrix[@iterasi_0[0],@iterasi_0[1],@iterasi_0[2],@iterasi_0[3],@iterasi_0[4],@iterasi_0[5],@iterasi_0[6],@iterasi_0[7],@iterasi_0[8]]
  end
  def read_matrix
    @matrix
  end
  def temp_soal(baris,kolom)
    @temp_soal << "#{baris}.#{kolom}"
  end
  def read_temp_soal
    @temp_soal
  end
  def row?(row)
    @matrix.row(row).to_a
  end
  def col?(col)
    @matrix.column(col).to_a
  end
  def blok?(row,col)
    blok_row = (row/3)*3
    blok_col = (col/3)*3
    @matrix.minor(blok_row,3,blok_col,3).to_a.flatten
  end
  def posibility_value?(row,col)
    value_imposible = (row?(row)+col?(col)+blok?(row,col)).uniq
    @posibility_value = [1,2,3,4,5,6,7,8,9,0] - value_imposible
  end
  def get_posibility_value
    @posibility_value
  end
  def set_next_val_iteration(baris,kolom,new_val)
    @temp_soal.delete_if { |e| e=="#{baris}.#{kolom}" }
    @iterasi_0[baris][kolom]=new_val
  end
  def next_new_iteration
    0.upto(8) do |baris|
      0.upto(8) do |kolom|
        if @iterasi_0[baris][kolom] == 0
          temp_soal(baris,kolom)
        end
      end
    end
  end
end
class Game
  def initialize
    @soal = Soal.new
    @soal.load_soal
    @soal.matrix
  end
  def solve?(counter=0)
    9.times do |e|
      puts @soal.matrix.row(e).to_a.join(" ")
    end
    puts *("===")
    if @soal.read_temp_soal.size == 0
      system("clear")
      puts "HASIL DARI SUDOKU SOLVER"
      9.times do |e|
        puts @soal.matrix.row(e).to_a.join(" ")
      end
      return
    end
    baris,kolom = @soal.read_temp_soal[counter].split(".")
    @soal.posibility_value?(baris.to_i,kolom.to_i)
    if @soal.get_posibility_value.size == 1
      @soal.set_next_val_iteration(baris.to_i,kolom.to_i,@soal.get_posibility_value[0])
      @soal.matrix
      solve?(0)
    else
      solve?(counter+1)
    end
  end
end