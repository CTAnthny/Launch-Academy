require 'pry'
require_relative 'deck'

class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
    hand_sum = 0
    @cards.each do |card|
      if card.match(/(\d{1,2})/)
        hand_sum += $1.to_i
      elsif card.match(/(J|Q|K)/)
        hand_sum += 10
      elsif card.match(/A/) && hand_sum <= 10
        hand_sum += 11
      elsif card.match(/A/) && hand_sum >= 11
        hand_sum += 1
      end
    end
    hand_sum
  end
end

# deck = Deck.new
# cards = deck.deal(2)
# hand = Hand.new(["10♦", "J♥", "A♥"])
# puts hand.cards
# puts hand.calculate_hand


#u2660 - spade
#u2663 - club
#u2665 - heart
#u2666 - diamond
