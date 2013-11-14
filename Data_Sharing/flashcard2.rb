class Soal
  def initialize(soal)
    @soal = soal
  end

  def get_soal
    @soal
  end
end

class Jawaban
  def initialize(jawaban)
    @jawaban = jawaban
  end

  def get_jawaban
    @jawaban
  end
end

class Flashcard
  def read_deck
    soal_temp=[]
    jawaban_temp=[]    
    data   = File.read("flashcard2.txt")
    split  = data.split("\n \n")
    shuff  = split.shuffle
    shuff.each do |x|
      soal, jawaban = x.split("\n")
      soal_temp << soal
      jawaban_temp << jawaban
    end
    @soal    = Soal.new(soal_temp)
    @jawaban = Jawaban.new(jawaban_temp)
    @soal_length = shuff.length - 1
  end

  def play
    @jawaban =
    input    = gets.chomp
  end
end

Flashcard.new.read_deck