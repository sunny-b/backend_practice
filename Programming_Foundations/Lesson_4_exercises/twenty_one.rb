require "pry"

GAME_NUMBER = 21
STAY_NUMBER = 17

def total(hand)
  score = 0
  hand.map do |cards|
    card = cards.split.first
    score += if card == 'Ace'
               11
             elsif card.to_i.zero?
               10
             else
               card.to_i
             end
  end

  hand.select { |cards| cards.split.first == 'Ace' }.count.times do
    score -= 10 if score > 21
  end

  score
end

def prompt(msg)
  puts("=> #{msg}")
end

def clear_screen
  system('clear') || system('cls')
end

def calculate_winner(player, dealer)
  total_player = total(player)
  total_dealer = total(dealer)

  if busted?(total_dealer)
    "Player"
  elsif busted?(total_player)
    "Dealer"
  elsif total_player > total_dealer
    'Player'
  elsif total_player < total_dealer
    'Dealer'
  else
    "Tie"
  end
end

def display_winner(winner)
  if winner == 'Player'
    prompt("Yay! You won this round!")
  elsif winner == 'Dealer'
    prompt("Dang! The dealer won this round!")
  else
    prompt("It's a draw!")
  end
end

def display_score(player_score, dealer_score)
  prompt("Player: #{player_score} vs. Dealer: #{dealer_score}")
end

def hit!(deck, player_hand)
  suit = deck.keys.sample
  card = deck[suit].sample
  deck[suit].delete(card)
  player_hand << name_card(suit, card)
end

def initialize_deck
  suits = %w(Spades Clubs Hearts Diamonds)
  cards = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
  deck = {}
  4.times do |num|
    deck[suits[num]] = cards
  end
  deck
end

def name_card(suit, card)
  name = case card
         when "A"
           "Ace"
         when "J"
           "Jack"
         when "Q"
           "Queen"
         when "K"
           "King"
         else
           card
         end
  "#{name} of #{suit}"
end

def joinand(array, deliminator = ', ', final = 'and')
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

def busted?(hand_score)
  hand_score > GAME_NUMBER
end

def initial_deal!(player_hand, dealer_hand, deck)
  2.times do
    hit!(deck, player_hand)
    hit!(deck, dealer_hand)
  end
end

def die
  prompt('Thank you for playing, goodbye!')
  exit
end

def game_end(player_hand, dealer_hand)
  prompt("#{calculate_winner(player_hand, dealer_hand)} won the game!")
  prompt('Enter "(y)es"if you want to play again.'\
         ' Otherwise, press "Enter"')
  play_again = gets.chomp.downcase
  die unless play_again == 'y' || play_again == 'yes'
  clear_screen
end

def play_again
  prompt('Press "Enter" to play again')
  gets.chomp
  clear_screen
end

clear_screen
prompt('Welcome to 21!')
prompt('The first person to 5 points wins the game!')

puts
player_score = 0
dealer_score = 0

loop do
  deck = initialize_deck
  player_hand = []
  dealer_hand = []

  initial_deal!(player_hand, dealer_hand, deck)
  prompt('You were dealt in.')
  prompt("Your hand: #{joinand(player_hand)}"\
         " for a total of #{total(player_hand)}")
  prompt("Dealer showing: #{dealer_hand[0]} and ?")

  loop do
    answer = nil
    loop do
      prompt("(H)it or (S)tay?")
      answer = gets.chomp.downcase
      break if ['h', 'hit', 's', 'stay'].include?(answer)
      prompt("Invalid entry. Please enter either 'h' or 's'")
    end

    break if answer == 'stay' || answer == 's'

    hit!(deck, player_hand)
    player_total = total(player_hand)
    prompt("Your hand: #{joinand(player_hand)}.")
    prompt("Your score: #{player_total}")

    break player_total if busted?(player_total)
  end

  player_total = total(player_hand)

  if busted?(player_total)
    prompt('Oh no! You busted! The dealer won!')

    dealer_score += 1
  else
    prompt("You stayed at #{player_total}")
    prompt('Dealer\'s turn.')
    loop do
      dealer_total = total(dealer_hand)
      if dealer_total > GAME_NUMBER
        prompt('Dealer busts!')
        break
      elsif dealer_total > player_total ||
            dealer_total == 21 ||
            (dealer_total == player_total &&
            dealer_total >= STAY_NUMBER)
        prompt('Dealer stays.')
        break
      else
        hit!(deck, dealer_hand)
        prompt('Dealer hits!')
      end
    end

    puts("============")
    prompt("Dealer has #{joinand(dealer_hand)} "\
           "for a total of: #{total(dealer_hand)}")
    prompt("Player has #{joinand(player_hand)} "\
           "for a total of: #{player_total}")
    puts("============")

    winner = calculate_winner(player_hand, dealer_hand)

    case winner
    when 'Player'
      player_score += 1
    when 'Dealer'
      dealer_score += 1
    end

    display_winner(winner)
  end

  display_score(player_score, dealer_score)
  unless player_score == 5 || dealer_score == 5
    play_again
    next
  end
  game_end(player_hand, dealer_hand)
  player_score = 0
  dealer_score = 0
end
