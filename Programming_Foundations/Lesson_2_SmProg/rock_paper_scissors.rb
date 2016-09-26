VALID_CHOICES = {
  'r' =>  'rock',
  'p' =>  'paper',
  'ss' => 'scissors',
  'l' =>  'lizard',
  'sp' => 'spock'
}

def rock_won?(player1, player2)
  (player1 == 'rock' &&
  (player2 == 'scissors' ||
   player2 == 'lizard'))
end

def paper_won?(player1, player2)
  (player1 == 'paper' &&
  (player2 == 'rock' ||
   player2 == 'spock'))
end

def scissors_won?(player1, player2)
  (player1 == 'scissors' &&
  (player2 == 'paper' ||
   player2 == 'lizard'))
end

def lizard_won?(player1, player2)
  (player1 == 'lizard' &&
  (player2 == 'paper' ||
   player2 == 'spock'))
end

def spock_won?(player1, player2)
  (player1 == 'spock' &&
  (player2 == 'rock' ||
   player2 == 'scissors'))
end

def winning_matchup(player1, player2)
  rock_won?(player1, player2) ||
    paper_won?(player1, player2) ||
    scissors_won?(player1, player2) ||
    lizard_won?(player1, player2) ||
    spock_won?(player1, player2)
end

def display_results(player, computer)
  if winning_matchup(player, computer)
    prompt("You won!")
  elsif winning_matchup(computer, player)
    prompt("You lost!")
  else
    prompt("It's a tie!")
  end
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def who_won?(player, computer)
  if winning_matchup(player, computer)
    return "player"
  elsif winning_matchup(computer, player)
    return "computer"
  else
    return "tie"
  end
end

player_score = 0
computer_score = 0

welcome_message = <<~MSG
Welcome to Rock Paper Scissors Lizard Spock
=> The first to 5 points wins!
MSG

prompt(welcome_message)
puts

loop do
  choice = nil

  loop do
    possible_choices = "Choose one:\n"\
      "r.) Rock\n"\
      "p.) Paper\n"\
      "ss.) Scissors\n"\
      "l.) Lizard\n"\
      "sp.) Spock\n"

    prompt(possible_choices)
    choice = Kernel.gets().chomp()
    choice = VALID_CHOICES[choice.downcase]

    break if VALID_CHOICES.value?(choice)
    puts
    prompt("Invalid choice.")
  end

  computer_choice = VALID_CHOICES.values.sample

  prompt("You chose #{choice}, computer chose #{computer_choice}")
  display_results(choice, computer_choice)

  winner = who_won?(choice, computer_choice)
  if winner == 'player'
    player_score += 1
  elsif winner == 'computer'
    computer_score += 1
  end

  if player_score == 5
    prompt("You reached 5 points! You won the game!")
    player_score = 0
    computer_score = 0
  elsif computer_score == 5
    prompt("Computer reached 5 points! You lost the game!")
    player_score = 0
    computer_score = 0
  else
    prompt("The score is You: #{player_score}. Computer: #{computer_score}")
  end

  puts
  prompt("Would you like to play again? (Y/N)")
  play_again = Kernel.gets().chomp()
  break unless play_again.casecmp('y').zero? || play_again.casecmp('yes').zero?
end

prompt("Thank you for playing, goodbye!")
