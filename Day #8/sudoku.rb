#require 'matrix'
# matrix = Matrix.[[1,2,3],[4,5,6][7,8,9]]
# matrix.row(0) => Vektor[1,2,3]
# matrix.column(0) => Vektor [1,4,7]
# matrix.minor(0,2,0,2) => Matrix[[1,2][4,5]]

# Baca Soal dan jadikan array
# 9 x 9 = 81 kalkulasikan kandidat angka untuk sel
# pilih satu angka dan isi sel
# recursive lanjutkan isi angka yang 0
# jika tidak ada kandidat angka untuk mengisi sel kosong then hapus angka *backtrack
# jika 81 sel terisi semua return true

# kandidat angka
# buat array 1-9
# cari sel dengan row yang sama then hapus angka dari array
# cari sel dengan kolom yang sama then hapus angka dari array
# cari sel dengan sub blok yang sama then hapus angka dari array
# sisa dalam array adalah kandidatnya
require 'matrix'

class Sudoku
  NUMBERS = *(0..9)

  def initialize(matrix)
    @matrix = matrix
  end

  def matrix(soal)
    array_soal = soal.split('').map(&:to_i)
    rows = *(0..8).map {array_soal.slice!(0,9)}
    @matrix = Matrix[*rows]
  end

  def row(r)
    @row = @matrix.row(r)
  end

  def column(c)
    @column = @matrix.column(c)
  end

  def possibility(row, column)
    used = []
    used << row(row)
    used << column(column)
    used << @matrix.minor(row/3*3,3,column/3*3,3).to_a

    puts used = NUMBERS - used.flatten.uniq
  end

  def solved?
    matrix.none?(&:zero) && valid?
  end

  def solve!
  end

  def valid?

  end  

  def distinct?
  end

  def build_new_matrix(row, column, value)
  end
end

class Printer
end

soal = '619.3..4.27..61..8....476214863.2.79.... 1458..31..9.6...572.8.632.1.6.5716.4...3.'
game = Sudoku.new
game.matrix(soal)
game.possibility(0,0)