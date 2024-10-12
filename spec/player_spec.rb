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

    player = Player.new('Clarisa', deck)
    
    
    expect(player.name).to eq('Clarisa')
    expect(player.deck).to eq(deck)
  end 

  it "can determine if they have lost" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)  
    deck = Deck.new([card1, card2, card3])
    
    player = Player.new('Clarisa', deck)
    player.deck.remove_card
    player.deck.remove_card
    player.deck.remove_card
    expect(player.deck.cards).to eq([])
    expect(player.has_lost?).to eq(true)
  end
  #binding.pry
end 