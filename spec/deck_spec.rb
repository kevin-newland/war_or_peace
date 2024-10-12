require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Deck do
  #describe "#initialize" do 
    it "exists" do
      card1 = Card.new(:diamond, 'Queen', 12)# setup creates an instance of the Card 
      card2 = Card.new(:spade, '3', 3)#setup creates an instance of the Card 
      card3 = Card.new(:heart, 'Ace', 14)#setup creates an instance of the Card 
      cards = [card1, card2, card3] #setup creates an instance of the array 

      deck = Deck.new(cards) # execution this creates a new instance of the Deck class, initializing it with the array of cards cards.

      expect(deck.cards).to eq([card1, card2, card3]) #assertion: checking that the decks cards match the expected cards
    end

    it "can find rank at a index" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3] 

      deck = Deck.new(cards)

      expect(deck.rank_of_card_at(0)).to eq(12)#assertion: checking if card at index 0 has a rank of 12
      expect(deck.rank_of_card_at(2)).to eq(14)#assertion: checking if card at index 2 has a rank of 14
    end

    it "high ranking cards" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3] 

      deck = Deck.new(cards)

      expect(deck.high_ranking_cards).to eq([card1, card3])# assertion: checking if deck.high_ranking_cards returns only the high-ranking cards [card1, card3].
    end 

    it "percentage high ranking" do 
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3] 
      expected_percentage = (2.to_f / 3.to_f * 100).round(2) #calculating the expected percentage and rounding it to two decimals places. (to_f: changes it to a float)
      deck = Deck.new(cards)
      expect(deck.percent_high_ranking).to eq(expected_percentage)#assertion checking that deck.percent_high_ranking matches the expected percentage
    end

    it "removes card"  do 
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3] 

      deck = Deck.new(cards)
      expect(deck.remove_card).to eq(card1)#execute and asserts that the card removed is card1
      expect(deck.cards).to eq([card2, card3])#asserts that the cards left are card2 and card3
    end 

    it "adds card" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3] 
      card4 = Card.new(:club, '5', 5)#the card that is added 

      deck = Deck.new(cards)

      deck.add_card(card4)#execution adds card4 to the deck 
      expect(deck.cards).to eq([card1, card2, card3, card4])#assertion checks to see if the card was added
      binding.pry
    end 

  #end
end