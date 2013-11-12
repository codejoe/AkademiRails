class Card
  def initialize(question, answer)
    @question = question
    @answer = answer
  end

  def answer
    @answer
  end

  def question
    @question
  end
end

class Parser
  def initialize(file)
    @file = file
  end

  def qa
    File.read(@file).split("\n \n")
  end

  def cards
    qa.map do |pair|
      answer, question = pair.split("\n")
      Card.new(answer, question)
    end
  end
end

class Deck
  def initialize(file)
    parser = Parser.new(file)
    @cards = parser.cards
  end

  def shuffle!
    @cards.shuffle!
  end

  def shift
    @cards.shift
  end

  def sample
    @cards.first
  end
end

class Dealer
  def initialize(deck)
    @deck = deck
  end

  def ask
    card = @deck.sample
    if card
      print_question card
      check gets.chomp
      ask
    else
      puts "Deck is empty. Exit program"
    end
  end

  def check(input)
    card = @deck.sample
    if input == card.answer
      puts "Correct answer!"
      @deck.shift
    else
      puts "Try again!"
    end
  end

  private

  def print_question(card)
    puts "Definition: #{card.question}"
    print "Guess: "
  end
end

class Game
  def initialize(deck)
    @deck = deck
    @dealer = Dealer.new(@deck)
  end

  def play
    @deck.shuffle!
    @dealer.ask
  end
end

deck = Deck.new('flashcards.txt')
game = Game.new(deck)
game.play
