class Question
  attr_accessor :list

  def initialize
    @list = ['Apple', 'Avocado', 'Banana', 'Black Berry', 'Cherry', 'Coconut', 'Durian', 'Grape', 'Guava', 'Lime', 'Mango', 'Melon', 'Orange', 'Papaya', 'Orange', 'Pineapple', 'Rambutan']
  end

  def shuffle
    list.map(&:downcase).shuffle random: Random.rand(999)
  end

end

class Player
  attr_reader   :chance
  attr_accessor :answers, :faults

  def initialize
    @chance  = 10
    @answers = []
    @faults  = []
  end

  def add_answer char, indexes
    indexes.each do |i|
      @answers[i] = char
    end
  end

  def add_fault char
    @faults << char unless faults.include? char
  end

  def life
    chance - faults.size
  end

  def die?
    faults.size >= @chance
  end

  def reset
    @answers = []
    @faults  = []
  end

end

class Hangman
  attr_reader :player, :questions

  def initialize
    @player    = Player.new
    @questions = Question.new.shuffle
    set_default_answers
  end

  def self.play
    puts "Welcome to \e[31mHangman\e[0m Game"
    puts 'Press any key to start'
    gets

    hangman = new
    hangman.ask

    if hangman.player.die?
      die = <<-DIE
  _ _ _ _ _
  |        |
  |        |
  |       ( )
  |       /|\\
  |       / \\
  |
  |
- - - - - - - - - - - - -
DIE
      puts "\e[31m------- YOU DIE -------\n #{die}\e[0m"
    else
      puts "\e[32m---------------- You Win! ----------------\e[0m"
    end
  end

  def set_default_answers
    player.answers = question.gsub(/\S/, '_').scan(/./) if question
  end

  def ask
    if questions.size > 0 && !player.die?
      clear_screen
      show_question
      print 'Answer: '
      char = gets.chomp.downcase.strip.slice(0, 1)

      check_character(char) unless char.empty?

      if answer_correct?
        clear_screen
        show_question
        puts "\e[32m#{question.upcase}\e[0m"
        gets

        questions.shift
        player.reset
        set_default_answers
      else
        clear_screen
        show_question
      end

      ask
    end
  end

  def question
    questions.first
  end

  def show_question
    puts "\e[33m!!! HANGMAN !!!\e[0m"
    puts 'Category: Fruit name.'
    puts 'Guess a letter!'
    puts "\e[31m  Faults: #{player.faults.join(' ')} \e[0m"
    puts "\e[32m  Chance: #{player.life} \e[0m"
    puts ''
    puts player.answers.join(' ')
  end

  def answer_correct?
    question == player.answers.join.strip
  end

  def check_character char
    if question.include? char
      indexes = question.enum_for(:scan, /#{char}/).map { Regexp.last_match.begin(0) }
      player.add_answer char, indexes
    else
      player.add_fault char
    end
  end

  def clear_screen
    # puts "\e[H\e[2J"
    system 'clear'
  end

end