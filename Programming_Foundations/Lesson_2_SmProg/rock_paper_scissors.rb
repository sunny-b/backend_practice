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

def winning?(player1, player2)
  rock_won?(player1, player2) ||
    paper_won?(player1, player2) ||
    scissors_won?(player1, player2) ||
    lizard_won?(player1, player2) ||
    spock_won?(player1, player2)
end

def display_results(player, computer)
  if winning?(player, computer)
    prompt("You won this round!")
  elsif winning?(computer, player)
    prompt("You lost this round!")
  else
    prompt("It's a tie!")
  end
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def the_winner(player, computer)
  if winning?(player, computer)
    "player"
  elsif winning?(computer, player)
    "computer"
  else
    "tie"
  end
end

def die
  prompt("Thank you for playing, goodbye!")
  exit
end

player_score = 0
computer_score = 0
name = nil

welcome_message = <<-MSG
Welcome to Rock Paper Scissors Lizard Spock
=> The first to 5 points wins!
MSG

possible_choices = <<-MSG
Choose one
r.) Rock
p.) Paper
ss.) Scissors
l.) Lizard
sp.) Spock
q.) Quit
MSG

prompt(welcome_message)
loop do
  prompt("What is your name?")
  name = Kernel.gets().chomp()
  if name.strip.empty?
    prompt("Please enter your name.")
  else
    break
  end
end

puts
prompt("#{name}, let's begin! (Enter 'Q' anytime to quit)")
loop do
  choice = nil

  loop do
    loop do
      prompt(possible_choices)
      choice = Kernel.gets().chomp().downcase()
      die if choice == 'q'
      choice = VALID_CHOICES[choice]

      break if VALID_CHOICES.value?(choice)
      puts
      prompt("Invalid choice. Please enter either r, p, ss, l, or sp")
    end

    computer_choice = VALID_CHOICES.values.sample

    prompt("You chose #{choice}, computer chose #{computer_choice}")
    display_results(choice, computer_choice)

    winner = the_winner(choice, computer_choice)
    if winner == 'player'
      player_score += 1
    elsif winner == 'computer'
      computer_score += 1
    end

    if player_score == 5
      prompt("Yay! #{name} reached 5 points! #{name} won the game!")
      player_score = 0
      computer_score = 0
      break
    elsif computer_score == 5
      prompt("Oh no! Computer reached 5 points! #{name} lost the game!")
      player_score = 0
      computer_score = 0
      break
    else
      prompt("The score is #{name}: #{player_score}. "\
             "Computer: #{computer_score}")
      puts
    end
  end

  puts
  prompt("Would you like to play again? (Y/N)")
  play_again = Kernel.gets().chomp()
  die unless play_again.casecmp('y').zero? || play_again.casecmp('yes').zero?
end
