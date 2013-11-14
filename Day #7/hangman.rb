require 'minitest/autorun'
class Question
  attr_reader :tebakan
  attr_accessor :live, :ava_alfabet, :used_alfabet, :jawab,:true_alfabet
	def initialize
    @tebakan = ['apel','mangga']
    @ava_alfabet = *('a'..'z')
    @used_alfabet = []
    @live = 5
    @jawab = {
      '1false' => 'a',
      '2false' => 'p',
      '3false' => 'e',
      '4false' => 'l'
    }
	end

  def get_question
    @tebakan.shuffle!
    @jawab
  end

  def check_ava(input)
    if @ava_alfabet.include?(input)
      @ava_alfabet.delete(input)
    end
  end

  def increment_used(input)
    @used_alfabet << input
    true
  end 

  def keluarkan(tebakan)
    key =''
    tebakan.length.times { key = key + '_ ' }
    key
  end

  def sisa_alfabet
    # ava_alvabet
  end
end


class Game
  def initialize
    @q = Question.new
    @q.get_question
  end

  def masukkan(input)
    @q.check_ava(input)
  end
  
  def cek_bener_nggak(input)
    salah = false
    i = 0
    @q.jawab.each do |key,value|
      if value == input  
        string = "#{i}true"
        @q.jawab[string] = value
        i+=1
      end
    end
  end

  def hasil_tebakan(input)
    i=0
    @q.jawab.each do |key,value|
      if key == "#{i}true"
        print value
      else
        print "_"
      end
    end
  end
  

  def start
    while @q.live <= 5

      puts "Available: ", @q.ava_alfabet.join
      puts "Used", @q.used_alfabet.join
      puts @q.jawab
      print "\n\n\n"
      print "Coba tebak?"
      input = gets.chomp
      masukkan(input)
      cek_bener_nggak(input)

      hasil_tebakan(input)
      

    end


  end

end

class MethodTesting < MiniTest::Unit::TestCase
  def setup
    @q1 = Question.new
  end
  
  def test_pertanyaan
    assert_equal 'apel', @q1.tebakan.first 
  end
  def test_kesempatan
    assert_equal 5, @q1.live
  end
  def test_available
    assert_equal 26, @q1.ava_alfabet.length
  end
  def test_used_alfabet
    assert_equal 0, @q1.used_alfabet.length
  end
  def test_keluarin_spasi
    assert_equal '_ _ _ _ ', @q1.keluarkan(@q1.tebakan.first)
  end
  def test_tebak_used_bertambah
    @q1.used_alfabet << 'a'
    @q1.used_alfabet << 'l'
    
    assert_equal ['a','l'], @q1.used_alfabet
  end

  def test_tebak_ava_berkurang
    @q1.ava_alfabet.delete('a')
    @q1.ava_alfabet.delete('c')
    assert_equal 24, @q1.ava_alfabet.length   
  end

  def input

  end 
end
