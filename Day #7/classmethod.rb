class Buah
  attr_reader :warna

  def initialize warna
    @warna = warna
  end

  def self.find search = {}

  end
end

Buah.find warna: 'kuning'

--------------------------
1 | pisang | kuning
2 | jeruk  | kuning
3 | apel   | merah