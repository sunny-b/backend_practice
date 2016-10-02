require "pry"

def total(hand)
  score = 0
  cards = hand.values.flatten

  cards.each do |card|
    if card == 'A'
      score += 11
    elsif card.to_i == 0
      score += 10
    else
      score += card.to_i
    end
  end

  cards.select { |card| card == 'A' }.count.times do 
    score -= 10 if score > 21
  end

  score
end

def prompt(msg)
  puts("=> #{msg}")
end

def calculate_winner(player, dealer)
  if total(player) > total(dealer)
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
  type = deck.keys.sample
  card = deck[type].sample
  deck[type].delete(card)
  current_player[type] << card
end

def initialize_deck
  {
  "Spades" => %w(A 2 3 4 5 6 7 8 9 10 J Q K),
  "Clubs" => %w(A 2 3 4 5 6 7 8 9 10 J Q K),
  "Hearts" => %w(A 2 3 4 5 6 7 8 9 10 J Q K),
  "Diamonds" => %w(A 2 3 4 5 6 7 8 9 10 J Q K),
  }
end

def display_card(category, card)
  if card.to_i == 0
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
  prompt("You were dealt the #{name} of #{category}")
end

def display_hand(player_hand)

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


deck = initialize_deck

player_hand = {
  "Spades" => [],
  "Clubs" => [],
  "Hearts" => [],
  "Diamonds" => []
}

dealer_hand = {
 "Spades" => [],
 "Clubs" => [],
 "Hearts" => [],
 "Diamonds" => []
}

prompt("Welcome to 21!")
puts

loop do
  initial_deal!(player_hand, dealer_hand, deck)
  prompt("You were dealt in.")
  prompt("Your hand")
  loop do
    prompt("Hit or Stay?")
    answer = gets.chomp.downcase
    break if answer == 'stay'
    hit!(deck, player_hand)
    display_card(type, card)
    break if busted?(total(player_hand))
  end

  if busted?
    prompt("Oh no! You busted!")
    prompt("Would you like to play again?(Y/N)")
    play_again = gets.chomp.downcase
    break unless play_again == 'y' || play_again == 'yes'
  else
    puts "You chose to stay!"
  end

  loop do
    if total(dealer_hand) >= 17
      break
    else
      hit(deck, dealer_hand)
    end
  end
end
