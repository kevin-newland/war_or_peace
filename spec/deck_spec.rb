require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Deck do
  #describe "#initialize" do
    it "exists" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3] 

      deck = Deck.new(cards)

      expect(deck.cards).to eq([card1, card2, card3]) 
    end

    it "can find rank at a index" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3] 

      deck = Deck.new(cards)

      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(2)).to eq(14)
    end

    it "high ranking cards" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3] 

      deck = Deck.new(cards)

      expect(deck.high_ranking_cards).to eq([card1, card3])
    end 

    it "percentage high ranking" do 
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3] 
      expected_percentage = (2.to_f / 3.to_f * 100).round(2)
      deck = Deck.new(cards)
      expect(deck.percent_high_ranking).to eq(expected_percentage)
    end

    it "removes card"  do 
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3] 

      deck = Deck.new(cards)
      expect(deck.remove_card).to eq(card1)
      expect(deck.cards).to eq([card2, card3])
    end 

    it "adds card" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3] 
      card4 = Card.new(:club, '5', 5)

      deck = Deck.new(cards)

      deck.add_card(card4)
      expect(deck.cards).to eq([card1, card2, card3, card4])
      binding.pry
    end 

  #end
end