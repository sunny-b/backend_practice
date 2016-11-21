module Displayable
  def display_welcome_message
    puts 'Welcome to Hangman!'
    puts 'Guess incorrectly 6 times and you lose!'
    puts 'Lets begin!'
  end

  def display_goodbye_message
    puts 'Thanks for playing! Good bye!'
  end

  def display_result
    board.display
    if won?
      puts "The word is #{board.word}! You won the game!"
      puts
    else
      puts 'Hangman! You lost the game!'
    end
  end
end

module Revealable
  def reveal_body
    puts 'Incorrect_guess!'
    board.update_board!(player.incorrect_guesses)
    player.incorrect_guesses += 1
  end

  def reveal_letter
    puts 'You guessed correctly!'
    board.update_word!(player.current_guess)
  end
end


# Player class
class Player
  attr_reader :name, :current_guess, :guesses
  attr_accessor :incorrect_guesses

  def initialize
    reset
  end

  def set_name
    name = nil
    loop do
      puts 'What\'s your name?'
      name = gets.chomp
      break unless name.strip.empty?
      puts 'Please enter a name'
    end
    @name = name
  end

  def reset
    @incorrect_guesses = 0
    @guesses = []
  end

  def guess!
    letter = guess_loop
    @current_guess = letter
    guesses << letter
  end

  private

  def guess_loop
    letter = nil
    loop do
      loop do
        puts "#{name} please pick a letter:"
        letter = gets.downcase.chomp
        break if ('a'..'z').cover? letter
      end
      return letter unless guesses.include? letter
      puts 'You already guessed that letter!'
    end
  end
end

# Boardgame class
class Board
  BODY_PARTS = ['O', '|', '/', '\\', '/', '\\'].freeze
  WORDS = %w(GENETIC BOOGIE SQUASH QUARTER HANGMAN CONTRADICTION FRIEND EMPLOYEE
             CHERRY ANNUAL FAVORABLE SENSATIONAL MOTHER BUFFET BUFFER STUDIO
             PERFUME FRAGRANT FRAGILE ACCOMPANY GOSSIP INSPIRE MOTIVE).freeze

  def initialize
    reset
  end

  def word
    @word.join
  end

  def reset
    @revealed_body_parts = [' ', ' ', ' ', ' ', ' ', ' ']
    @word = WORDS.sample.chars
    @unknown_word = []
    @word.size.times { @unknown_word << '_' }
  end

  def display
    puts '+--------+'
    puts '|        |'
    puts '|        |'
    puts "|        #{revealed_body_parts[0]}"
    puts "|       #{revealed_body_parts[2]}#{revealed_body_parts[1]}#{revealed_body_parts[3]}"
    puts "|       #{revealed_body_parts[4]} #{revealed_body_parts[5]}"
    puts '|'
    puts '|'
    puts '-'
    puts
    puts "WORD: #{unknown_word.join(' ')}"
    puts
  end

  def hangman?
    revealed_body_parts == BODY_PARTS
  end

  def word_finished?
    unknown_word == @word
  end

  def verify(letter)
    word.include? letter.upcase
  end

  def update_word!(letter)
    indexes = @word.each_index.select { |i| @word[i] == letter.upcase }
    indexes.each do |index|
      unknown_word[index] = letter.upcase
    end
  end

  def update_board!(guess_num)
    revealed_body_parts[guess_num] = BODY_PARTS[guess_num]
  end

  private

  attr_reader :revealed_body_parts, :unknown_word
end

# Main game class
class Hangman
  include Displayable, Revealable

  attr_reader :player, :board

  def initialize
    @player = Player.new
    @board = Board.new
  end

  def play
    clear_screen
    display_welcome_message
    player.set_name
    main_game_loop
    display_goodbye_message
  end

  private

  def main_game_loop
    loop do
      clear_screen
      loop do
        board.display
        player.guess!
        clear_screen
        evalulate_guess
        break if won? || lost?
      end
      display_result
      break unless play_again?
      reset_game
    end
  end

  def quit
    puts 'Thanks for playing!'
    exit
  end

  def another_round
    puts 'Enter \'Q\' to quit, other enter any key to keep going.'
    answer = gets.chomp
    quit if answer.downcase == 'q'
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (Y/N)'
      answer = gets.chomp
      break if %w(y n).include? answer
      puts 'Please enter either Y or N.'
    end
    answer == 'y'
  end

  def clear_screen
    system 'clear'
    system 'cls'
  end

  def correct_guess?
    board.verify(player.current_guess)
  end

  def lost?
    board.hangman?
  end

  def won?
    board.word_finished?
  end

  def reset_game
    player.reset
    board.reset
  end

  def evalulate_guess
    correct_guess? ? reveal_letter : reveal_body
  end
end

Hangman.new.play
