require 'pry'

TARGET_SCORE = 21
DEALER_STAY_SCORE = 17

def prompt(string)
  puts "=> #{string}"
end

def joinand(arr, separator = ', ', join_word = 'and')
  arr[-1] = "#{join_word} #{arr.last}" if arr.size > 1
  arr.size == 2 ? arr.join(' ') : arr.join(separator)
end

def begin_game
  prompt "Press enter to receive your cards and start the hand."
  gets.chomp
end

def initialize_deck
  cards = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)
  suits = %w(clubs diamonds hearts spades)
  deck = Hash.new

  suits.each do |suit|
    cards.each do |card|
      deck["#{card} of #{suit}"] = if card == 'ace'
                                     11
                                   elsif card.to_i.zero?
                                     10
                                   else
                                     card.to_i
                                   end
    end
  end
  deck
end

def deal_card!(deck)
  card_name = deck.keys.sample
  card = { card_name => deck[card_name] }
  deck.delete(card_name)
  card
end

def deal_first_turn!(deck)
  deal_card!(deck).merge(deal_card!(deck))
end

def calculate_total(cards)
  total = 0

  cards.each { |_, val| total += val }

  correction_factor = cards.select { |_, val| val == 11 }.count

  correction_factor.times do
    total -= 10 if total > TARGET_SCORE
  end

  total
end

def display_hand(player, cards)
  if player == 'player'
    prompt "You hold the #{joinand(cards.keys)}. \
(Value: #{calculate_total(cards)})"
  else
    prompt "The dealer holds the #{joinand(cards.keys)} \
(Value: #{calculate_total(cards)})"
  end
end

def display_hidden_hand(cards)
  prompt "The dealer holds the #{joinand(cards.keys.drop(1))} \
and one other card."
end

def hit?
  prompt "Would you like to hit (H) or stay (S)?"

  loop do
    action = gets.chomp.downcase

    if action == "h"
      return true
    elsif action == "s"
      prompt "You chose to stay."
      return false
    else
      prompt "Please enter H to receive another card or S to stay."
    end
  end
end

def player_turn(deck, cards)
  while hit?
    cards = cards.merge!(deal_card!(deck))
    display_hand('player', cards)
    break if busted?(cards)
  end
end

def busted?(cards)
  calculate_total(cards) > TARGET_SCORE ? true : false
end

def continue_game
  prompt "Press enter to continue."
  gets.chomp
end

def dealer_turn(deck, cards)
  while calculate_total(cards) < DEALER_STAY_SCORE
    new_card = deal_card!(deck)
    prompt "The dealer chose to hit and drew the #{joinand(new_card.keys)}."
    cards = cards.merge!(new_card)
  end
end

def detect_winner(player_cards, dealer_cards)
  player_total = calculate_total(player_cards)
  dealer_total = calculate_total(dealer_cards)

  if busted?(player_cards)
    return 'dealer'
  elsif busted?(dealer_cards)
    return 'player'
  elsif player_total < dealer_total
    return 'dealer'
  elsif player_total > dealer_total
    return 'player'
  end
end

def display_winner(player_cards, dealer_cards)
  winner = detect_winner(player_cards, dealer_cards)
  if winner == 'dealer'
    prompt "The dealer won!"
  elsif winner == 'player'
    prompt "You won!"
  else
    prompt "It's a tie!"
  end
end

def play_again?
  prompt "Would you like to play again? (Y or N)"

  loop do
    answer = gets.chomp.downcase

    if answer == 'y'
      return true
    elsif answer == 'n'
      return false
    else
      prompt "Please enter Y to play again or N to stop."
    end
  end
end

loop do
  player_wins = 0
  dealer_wins = 0

  loop do
    deck = initialize_deck

    system 'clear'

    if player_wins.zero? && dealer_wins.zero? then prompt <<WELCOME
Welcome to #{TARGET_SCORE}! You and the dealer will each receive two cards.
   You can see both of your cards, but only one of the dealer's.
   The object is to get as close to #{TARGET_SCORE} as possible without going
   over. Depending on the value of the cards, each player may
   choose to hit (receive another card) or stay. When both players
   stay, the player whose hand is closest to #{TARGET_SCORE} without going over
   wins. The first to win five hands wins the game.
WELCOME
    end
    begin_game
    player_cards = deal_first_turn!(deck)
    display_hand('player', player_cards)
    dealer_cards = deal_first_turn!(deck)
    display_hidden_hand(dealer_cards)
    player_turn(deck, player_cards)
    if busted?(player_cards)
      prompt "You busted."
    else
      prompt "It's the dealer's turn."
      continue_game
      dealer_turn(deck, dealer_cards)
      if busted?(dealer_cards)
        display_hand('dealer', dealer_cards)
        prompt "The dealer busted."
      else
        prompt "The dealer chose to stay."
        display_hand('dealer', dealer_cards)
      end
    end
    display_winner(player_cards, dealer_cards)
    if detect_winner(player_cards, dealer_cards) == 'player'
      player_wins += 1
    else
      dealer_wins += 1
    end
    prompt "Current score: You: #{player_wins}. Dealer: #{dealer_wins}."
    if player_wins < 5 && dealer_wins < 5
      continue_game
    elsif player_wins == 5
      prompt "You won the match!"
      break
    else
      prompt "The dealer won the match!"
      break
    end
  end
  if !play_again?
    prompt "Thanks for playing."
    break
  end
end