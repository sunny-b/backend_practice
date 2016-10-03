require "pry"

# rubocop:disable Metrics/MethodLength
def total(hand)
  score = 0
  cards = []
  hand.each { |str| cards << str.split.first }

  cards.each do |card|
    if card == 'Ace'
      score += 11
    elsif card.to_i.zero?
      score += 10
    else
      score += card.to_i
    end
  end

  cards.select { |card| card == 'Ace' }.count.times do
    score -= 10 if score > 21
  end

  score
end
# rubocop:enable Metrics/MethodLength

def prompt(msg)
  puts("=> #{msg}")
end

def calculate_winner(player, dealer)
  if total(player) > total(dealer) || busted?(total(dealer))
    "Player"
  elsif total(player) < total(dealer)
    "Dealer"
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

def hit!(deck, current_player)
  suit = deck.keys.sample
  card = deck[suit].sample
  deck[suit].delete(card)
  current_player << name_card(suit, card)
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
  if card.to_i.zero?
    name = case card
           when "A"
             "Ace"
           when "J"
             "Jack"
           when "Q"
             "Queen"
           when "K"
             "King"
           end
  else
    name = card
  end
  "#{name} of #{suit}"
end

def joinand(array, deliminator = ', ', final = 'and')
  if array.size == 1
    return array.first
  else
    last = array.pop
    string = array.join(deliminator)
    string << " #{final} #{last}"
    array << last
    return string
  end
end

def busted?(hand_score)
  hand_score > 21
end

def initial_deal!(player_hand, dealer_hand, deck)
  2.times do
    hit!(deck, player_hand)
    hit!(deck, dealer_hand)
  end
end

def die
  prompt("Thank you for playing, goodbye!")
  exit
end

def play_again
  prompt("Would you like to play again?(Y/N)")
  play_again = gets.chomp.downcase
  die unless play_again == 'y' || play_again == 'yes'
  puts
  puts
end

prompt("Welcome to 21!")
puts

loop do
  deck = initialize_deck
  player_hand = []
  dealer_hand = []

  initial_deal!(player_hand, dealer_hand, deck)
  prompt("You were dealt in.")
  prompt("Your hand: #{joinand(player_hand)}"\
         " for a total of #{total(player_hand)}")
  prompt("Dealer showing: #{dealer_hand[0]} and ?")
  loop do
    prompt("(H)it or (S)tay?")
    answer = gets.chomp.downcase
    break if answer == 'stay' || answer == 's'
    hit!(deck, player_hand)
    player_total = total(player_hand)
    prompt("Your hand: #{joinand(player_hand)}.")
    prompt("Your score: #{player_total}")
    break player_total if busted?(player_total)
  end

  player_total = total(player_hand)

  if busted?(player_total)
    prompt("Oh no! You busted! The dealer won!")
  else
    prompt("You stayed at #{player_total}")
    prompt("Dealer's turn.")
    loop do
      dealer_total = total(dealer_hand)
      if dealer_total > 21
        prompt("Dealer busts!")
        break
      elsif ((dealer_total > player_total) &&
            dealer_total >= 17) || dealer_total == 21
        prompt("Dealer stays.")
        break
      else
        hit!(deck, dealer_hand)
        prompt("Dealer hits!")
      end
    end

    puts("============")
    prompt("Dealer has #{joinand(dealer_hand)} "\
           "for a total of: #{total(dealer_hand)}")
    prompt("Player has #{joinand(player_hand)} "\
           "for a total of: #{player_total}")
    puts("============")
    display_winner(calculate_winner(player_hand, dealer_hand))
  end
  play_again
end
