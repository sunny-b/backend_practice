module Clearable
  def clear_screen
    system "clear"
    system "cls"
  end
end

module Displayable
  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts "The first to get three in a row wins a point!"
    puts "The first to #{TTTGame::PLAY_TO} points wins the game!"
  end

  def display_goodbye_message
    puts "Thanks for playing! Good bye!"
  end

  def display_game_winner
    winner = human.won? ? human.name : computer.name
    puts "#{winner} was the first to #{TTTGame::PLAY_TO} points. #{winner} won!"
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "#{human.name} Won!"
    when computer.marker
      puts "#{computer.name} Won!"
    else
      puts "It's a tie!"
    end
  end

  def display_score
    puts "------------------------"
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
    puts "------------------------"
  end

  def display_board
    puts "#{human.name} is #{human.marker}. #{computer.name} is #{computer.marker}"
    puts
    board.draw
    puts
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end
end

# State of board
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  def middle_empty?
    @squares[5].unmarked?
  end

  def at_risk_square(game_marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if need_to_move?(squares, game_marker)
        unmarked = squares.select(&:unmarked?)
        return @squares.key(unmarked.first)
      end
    end
    nil
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end

  def need_to_move?(squares, game_marker)
    markers = squares.select(&:marked?).collect(&:marker)

    markers.size == 2 &&
      markers.uniq.size == 1 &&
      markers.first == game_marker
  end
end

class Square
  INITIAL_MARKER = ' '.freeze
  attr_accessor :marker

  def initialize
    @marker = INITIAL_MARKER
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  include Clearable, Displayable
  attr_accessor :marker, :score, :name

  def initialize
    @score = 0
  end

  def increase_score
    self.score += 1
  end

  def reset_score
    self.score = 0
  end

  def won?
    self.score >= TTTGame::PLAY_TO
  end
end

class Human < Player
  def set_name
    name = nil
    loop do
      puts "Please enter your name:"
      name = gets.chomp
      break unless name.empty?
      puts "Invalid entry."
    end
    @name = name
  end

  def set_marker
    marker = nil
    loop do
      puts "Do you want your marker to be X or O? (X goes first)"
      marker = gets.chomp.downcase
      break if ['x', 'o'].include?(marker)
      puts "Invalid choice"
    end
    @marker = (marker == 'x' ? TTTGame::X_MARKER : TTTGame::O_MARKER)
  end
end

class Computer < Player
  def set_name
    @name = %w(Computer Hal R2D2 Chappie Hal Bender Big-Brother).sample
  end
end

class TTTGame
  include Displayable, Clearable

  X_MARKER = 'X'.freeze
  O_MARKER = 'O'.freeze
  FIRST_TO_MOVE = X_MARKER
  PLAY_TO = 5

  attr_reader :human, :computer
  attr_accessor :board

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @current_player = FIRST_TO_MOVE
  end

  def play
    clear_screen
    display_welcome_message
    set_names
    set_markers
    game_loop
    display_goodbye_message
  end

  private

  def game_loop
    loop do
      loop do
        play_one_round
        break if someone_won_game?
        ask_for_another_round
        reset_round
      end
      display_game_winner
      break unless play_again?
      reset_game
    end
  end

  def set_markers
    human.set_marker

    computer.marker = case human.marker
                      when X_MARKER then O_MARKER
                      else X_MARKER
                      end
  end

  def set_names
    human.set_name
    computer.set_name
  end

  def play_one_round
    display_board
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
    increase_winner_score
    display_result
    display_score
  end

  def reset_game
    reset_round
    human.reset_score
    computer.reset_score
  end

  def someone_won_game?
    human.score >= TTTGame::PLAY_TO || computer.score >= TTTGame::PLAY_TO
  end

  def die
    display_goodbye_message
    exit
  end

  def ask_for_another_round
    puts "Enter 'Q' if you want to quit. Otherwise enter any key to play again."
    answer = gets.chomp.downcase
    die if answer == 'q'
  end

  def increase_winner_score
    case board.winning_marker
    when human.marker then human.increase_score
    when computer.marker then computer.increase_score
    end
  end

  def human_moves
    puts "#{human.name} choose a square: #{joinor(board.unmarked_keys)}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    board[computer_strategy] = computer.marker
  end

  def computer_strategy
    if board.middle_empty?
      5
    elsif !!board.at_risk_square(O_MARKER)
      board.at_risk_square(O_MARKER)
    elsif !!board.at_risk_square(X_MARKER)
      board.at_risk_square(X_MARKER)
    else
      board.unmarked_keys.sample
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (Y/N)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Please answer with a Y or N"
    end
    answer == 'y'
  end

  def reset_round
    board.reset
    clear_screen
    @current_player = FIRST_TO_MOVE
    puts "Let's play again!"
  end

  def human_turn?
    @current_player == human.marker
  end

  def alternate_player
    @current_player = case @current_player
                      when X_MARKER then O_MARKER
                      else X_MARKER
                      end
  end

  def current_player_moves
    case @current_player
    when human.marker then human_moves
    else computer_moves
    end

    alternate_player
  end

  def joinor(array, delimiter = ', ', word = 'or')
    return array.first if array.size == 1
    string = array[0...-1].join(delimiter)
    string << " #{word} #{array.last}"
  end
end

game = TTTGame.new
game.play
