require './lib/card'
require './lib/deck'
require './lib/player'
require 'rspec'
require 'pry'
# player is initialized witha  deck, and can determine if they have lost a game. 
RSpec.describe Player do
  it "exists" do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)  
    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)#Execution creates player OBJECT with name and deck(reminder that deck was already created)
    
    
    expect(player.name).to eq('Clarisa')#assertion checks to see if the players name is equal to 'clarisa'
    expect(player.deck).to eq(deck)#assertion checks to see if the players deck is equal to the deck that was given to the player upon creation
  end 

  it "can determine if they have lost" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)  
    deck = Deck.new([card1, card2, card3])
    
    player = Player.new('Clarisa', deck)
    player.deck.remove_card#execution removes card from the deck
    player.deck.remove_card
    player.deck.remove_card
    expect(player.deck.cards).to eq([])#assertion checks to see if all the cards in the deck have been removed 
    expect(player.has_lost?).to eq(true)# assertion checks to see if the player has lost
  end
  #binding.pry
end 