require 'pry'

module Clearable
  def clear_screen
    system 'clear'
    system 'cls'
  end
end

module Displayable
  def display_welcome_message
    puts "Welcome to 21!"
    puts "First one to win #{Game::PLAY_TO} rounds wins the game!"
    puts "You will be playing against the dealer."
  end

  def display_result
    player.show_cards
    dealer.show_cards
    puts
    display_winner
  end

  def display_winner
    case !!determine_winner
    when true then puts "#{determine_winner.name} wins!"
    else puts "It's a tie!"
    end
  end

  def display_score
    puts "--------------"
    puts "#{player.name}: #{player.score}"
    puts "#{dealer.name}: #{dealer.score}"
    puts "--------------"
  end

  def display_initial_cards
    player.show_cards
    dealer.show_top_card
  end

  def display_goodbye_message
    puts "Thanks for playing! Good bye!"
  end

  def display_game_winner
    winner = (player.score == Game::PLAY_TO ? player : dealer)
    puts "#{winner.name} was the first to #{Game::PLAY_TO} points."\
         " #{winner.name} wins!"
  end
end

class Participant
  include Clearable

  attr_accessor :name, :hand, :score

  def initialize
    @hand = []
    @score = 0
  end

  def beat?(other_player)
    total > other_player.total
  end

  def overall_reset
    @hand = []
    @score = 0
  end

  def reset_hand
    @hand = []
  end

  def increase_score
    @score += 1
  end

  def hit!(deck)
    @hand << deck.deal!
    puts "#{name} hit!"
  end

  def stay
    puts "#{name} stays"
  end

  def bust?
    total > Game::GAME_SCORE
  end

  def busted(other_player)
    puts
    puts "#{name} busts! #{other_player.name} wins!"
  end

  def show_cards
    puts
    puts "#{name}'s hand:"
    hand.each { |card| puts "- #{card}" }
    puts "Total: #{total}"
  end

  def total
    sum = hand.map(&:score).reduce(:+)

    correction_factor = hand.select { |card| card.score == 11 }.count
    correction_factor.times do
      sum -= 10 if sum > Game::GAME_SCORE
    end
    sum
  end
end

class Player < Participant
  def set_name
    name = nil
    loop do
      puts "What is your name?"
      name = gets.chomp
      break unless name.strip.empty?
      puts "Please enter your name."
    end
    @name = name
  end

  def stay
    clear_screen
    puts "#{name} stays at #{total}"
  end

  def hit_or_stay
    answer = nil
    loop do
      puts "(H)it or (S)tay?"
      answer = gets.chomp.downcase
      break if %w(s stay h hit).include?(answer)
      puts "Invalid choice. Please enter H or S"
    end
    answer
  end

  def turn(other_player, deck)
    loop do
      break if %w(s stay).include?(hit_or_stay)
      clear_screen
      hit!(deck)
      show_cards
      return busted(other_player) if bust?
      other_player.show_top_card
    end
    stay
  end
end

class Dealer < Participant
  def set_name
    @name = 'Dealer'
  end

  def show_top_card
    card = hand.first
    puts
    puts "The #{name} is showing a #{card}."
  end

  def busted(other_player)
    show_cards
    puts
    puts "#{name} busts! #{other_player.name} wins!"
  end

  def turn(other_player, deck)
    puts "It's now the Dealer's turn."
    until (total > other_player.total) || total == Game::GAME_SCORE
      hit!(deck)
      return busted(other_player) if bust?
    end
    stay
  end
end

class Deck
  SUITS = ['Hearts', 'Clubs', 'Diamonds', 'Spades'].freeze
  FACES = ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King'].freeze

  def initialize
    @cards = FACES.product(SUITS)
    @cards.shuffle!
  end

  def deal!
    Card.new(@cards.pop)
  end

  def reset
    @cards = FACES.product(SUITS)
    @cards.shuffle!
  end
end

class Card
  def initialize(card_array)
    @face = card_array.first
    @suit = card_array.last
  end

  def to_s
    "#{@face} of #{@suit}"
  end

  def score
    return @face if @face.to_s.to_i == @face

    case @face[0]
    when 'A' then 11
    else 10
    end
  end
end

class Round
  include Clearable

  def dealing_cards(game, player, dealer, deck)
    game.deal_cards
    game.display_initial_cards
    player.turn(dealer, deck)
    return if player.bust?
    dealer.turn(player, deck)
    return if dealer.bust?
    game.display_result
  end

  def scoring(game, player, dealer, deck)
    loop do
      dealing_cards(game, player, dealer, deck)
      game.increase_winner_score
      game.display_score
      return if game.someone_won?
      game.play_another_round
      clear_screen
      game.reset_hands
    end
  end

  def main_loop(game, player, dealer, deck)
    loop do
      scoring(game, player, dealer, deck)
      game.display_game_winner
      return unless game.play_again?
      clear_screen
      game.reset_game
    end
  end
end

class Game
  include Clearable, Displayable

  GAME_SCORE = 21
  PLAY_TO = 5

  attr_accessor :player, :dealer
  attr_reader :deck, :round

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
    @round = Round.new
  end

  def start
    clear_screen
    display_welcome_message
    set_names
    round.main_loop(self, player, dealer, deck)
    display_goodbye_message
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (Y/N)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Please enter either Y or N"
    end
    answer == 'y'
  end

  def someone_won?
    player.score == PLAY_TO || dealer.score == PLAY_TO
  end

  def reset_hands
    player.reset_hand
    dealer.reset_hand
  end

  def reset_game
    player.overall_reset
    dealer.overall_reset
  end

  def play_another_round
    puts "Enter 'Q' if you want to quit. Otherwise enter any key to play again."
    answer = gets.chomp.downcase
    die if answer == 'q'
  end

  def die
    display_goodbye_message
    exit
  end

  def increase_winner_score
    determine_winner.increase_score if !!determine_winner
  end

  def determine_winner
    if player.bust?
      return dealer
    elsif dealer.bust?
      return player
    elsif player.beat?(dealer)
      return player
    elsif dealer.beat?(player)
      return dealer
    end
    nil
  end

  def set_names
    player.set_name
    dealer.set_name
  end

  def deal_cards
    puts "#{player.name} has been dealt in."

    deck.reset
    2.times do
      player.hand << deck.deal!
      dealer.hand << deck.deal!
    end
  end
end

Game.new.start
