class Questions
  attr_reader :list_questions
  attr_accessor :life, :available_alfabet, :wrong_alfabet, :true_alfabet, :answer
	def initialize
    @list_questions = ['mangga','apel','nanas']
    @available_alfabet = *('a'..'z')
    @wrong_alfabet = []
    @true_alfabet = {}
    @life = 5

	end

  def true_alfabet_init
    shuffle!.split('').uniq.each{ |value| @true_alfabet[value] = false } # { 'm' => true, 'a' => true, 'n' => false, 'g' => false  }
  end

  def shuffle!
    @answer = @list_questions.shuffle.first # "mangga"
  end
  
  def take_alfabet(alfabet)
    @available_alfabet.delete(alfabet) if @available_alfabet.include?(alfabet) 
  end

  def check(alfabet) #'m'
    @true_alfabet.has_key?(alfabet)# @true_alfabet?'m'
  end

  def processing(boolean,input) # true,x
    if boolean
      @true_alfabet[input] = true # true_alfabet['m'] = true
    else
      unless wrong_alfabet.include?(input)
        @wrong_alfabet << input 
        @life -= 1
      end
    end
  end
  def print_answer
    @answer.split('').each do |alfabet| #PERTAMA "mangga" -> ['m','a','n','g','g','a']
      if @true_alfabet[alfabet] == true  #@true_alfabet['n'] == true? _ _ _ _ _
        print alfabet
      else
        print "_"
      end
    end
    puts "#"
  end

  def information
    puts "WRONG : ", wrong_alfabet.join('')
    puts "AVAILABLE : ", available_alfabet.join('')
  end

  def true_alfabet_completed?
    @true_alfabet.all? { |key,value| value == true }
  end
end


class Game
  def initialize
    @question = Questions.new
    @question.shuffle!
    @question.true_alfabet_init
  end

  def guess
    print "\nGuess : "
    input = gets.chomp
    print "\n\n"
    input
  end

  def mechanic
    @question.information
    input = guess
    @question.take_alfabet(input)      
    @question.processing(@question.check(input), input) # true,'m'
  end

  def win
    puts "Anda Menang"
  end 

  def lost
    puts "Anda Kalah"
  end

  def ask
    if @question.life >= 1
      # puts @question.answer #CONTEKAN 
      @question.print_answer
      return win if @question.true_alfabet_completed?
      mechanic
      ask
    else
      lost
    end
  end
end

# class MethodTesting < MiniTest::Unit::TestCase
#   def setup
#     @q1 = Questions.new
#   end
  
#   def test_kesempatan
#     assert_equal 1, @q1.live
#   end
#   def test_available
#     assert_equal 26, @q1.available_alfabet.length
#   end
#   def test_used_alfabet
#     assert_equal 0, @q1.wrong_alfabet.length
#   end
#   def test_pertanyaan
#     @q1.shuffle!
#     assert_equal "mangga", @q1.answer
#   end 


#   def take_alfabet
#     assert_equal "Asda", @q1.take_alfabet('a')
#   end


# end
