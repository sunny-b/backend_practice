require 'set'
require_relative 'card_test'

class PokerHand
  def initialize(deck)
    @hand = []
    @rank_cards = Hash.new(0)
    5.times do
      card = deck.draw
      @hand << card
      @rank_cards[card.value_rank] += 1
    end
  end

  def print
    @hand.each { |card| puts card }
  end


  def evaluate
    if    royal_flush?     then 'Royal flush'
    elsif straight_flush?  then 'Straight flush'
    elsif four_of_a_kind?  then 'Four of a kind'
    elsif full_house?      then 'Full house'
    elsif flush?           then 'Flush'
    elsif straight?        then 'Straight'
    elsif three_of_a_kind? then 'Three of a kind'
    elsif two_pair?        then 'Two pair'
    elsif pair?            then 'Pair'
    else 'High card'
    end
  end

  private

  def royal_flush?
    return false if @rank_cards.any? { |_, count| count > 1 }
    suit = @hand.first.suit

    @rank_cards.keys.reduce(:+) == 60 &&
      @hand.all? { |card| card.suit == suit }
  end

  def straight_flush?
    return false if @rank_cards.any? { |_, count| count > 1 }
    suit = @hand.first.suit

    (@rank_cards.keys.max - @rank_cards.keys.min == 4) &&
      @hand.all? { |card| card.suit == suit }
  end

  def four_of_a_kind?
    @rank_cards.any? { |_, count| count >= 4 }
  end

  def full_house?
    @rank_cards.values.sort == [2, 3]
  end

  def flush?
    suit = @hand.first.suit
    @hand.all? { |card| card.suit == suit }
  end

  def straight?
    return false if @rank_cards.any? { |_, count| count > 1 }
    @rank_cards.keys.max - @rank_cards.keys.min == 4
  end

  def three_of_a_kind?
    @rank_cards.any? { |_, count| count >= 3 }
  end

  def two_pair?
    @rank_cards.values.count(2) == 2
  end

  def pair?
    @rank_cards.any? { |_, count| count >= 2 }
  end
end

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if @deck.empty?
    @deck.pop
  end

  private

  def reset
    @deck = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end

    @deck.shuffle!
  end
end

class Card
  attr_reader :rank, :suit
  include Comparable

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  SUITS = { 'Diamonds' => 1, 'Clubs' => 2, 'Hearts' => 3, 'Spades' => 4}

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value_rank
    VALUES.fetch(@rank, @rank)
  end

  def value_suit
    SUITS.fetch(@suit)
  end


  def <=>(other_card)
    if value_rank == other_card.value_rank
      value_suit <=> other_card.value_suit
    else
      value_rank <=> other_card.value_rank
    end
  end
end
