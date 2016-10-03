require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display(brd)
  system 'clear'
  puts "Player: #{PLAYER_MARKER}. Computer: #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/Abcsize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ""
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  if needs_to_move?(brd)
    square = at_risk_square(brd)
    brd[square] = COMPUTER_MARKER
  elsif brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def die
  prompt("Thanks for playing, goodbye!")
  exit
end

def joinor(array, deliminator = ', ', final = 'or')
  if array.size == 1
    array.first
  else
    last = array.pop
    string = array.join(deliminator)
    string << " #{final} #{last}"
    array << last
    string
  end
end

def at_risk_square(brd)
  offense = find_square(brd, COMPUTER_MARKER)
  defense = find_square(brd, PLAYER_MARKER)
  if !!offense
    offense
  elsif !!defense
    defense
  else
    nil
  end
end

def find_square(brd, mark)
  WINNING_LINES.each do |line|
    next unless (brd.values_at(*line).count(mark) == 2 && # Offense
                 brd.values_at(*line).count(INITIAL_MARKER) == 1)
    square = brd.select do |sqr, marker|
      line.include?(sqr) && marker == INITIAL_MARKER
    end.keys.first
    return square
  end
  nil
end

def needs_to_move?(brd)
  !!at_risk_square(brd)
end

def display_score(player_score, computer_score)
  prompt("Player: #{player_score} vs. Computer: #{computer_score}")
end

def place_piece!(brd, current_player)
  case current_player
  when 'Player'
    player_places_piece!(brd)
  when 'Computer'
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  case current_player
  when 'Player'
    current_player.replace 'Computer'
  when 'Computer'
    current_player.replace 'Player'
  end
end

player_score = 0
computer_score = 0

loop do
  loop do
    board = initialize_board
    current_player = "Player"
    loop do
      display(board)
      place_piece!(board, current_player)
      alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display(board)

    if someone_won?(board)
      if detect_winner(board) == 'Player'
        player_score += 1
      else
        computer_score += 1
      end

      if player_score < 5 && computer_score < 5
        prompt "#{detect_winner(board)} wins a point! "\
        "First person to 5 points wins the game!"
        display_score(player_score, computer_score)
      else
        prompt("#{detect_winner(board)} got 5 points. They win the game!")
        player_score = 0
        computer_score = 0
        break
      end
    else
      prompt("It's a tie!")
      display_score(player_score, computer_score)
    end
    prompt("Press 'Enter' to play again")
    gets.chomp
  end
  prompt("Would you like to play again?(Y)")
  play_again = gets.chomp.downcase
  die unless play_again == 'y' || play_again == 'yes'
end
