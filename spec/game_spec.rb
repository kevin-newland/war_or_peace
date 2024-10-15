require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
  describe'#initialize' do
    it 'is instance of game' do 
      suits = [:heart, :diamond, :spade, :club]

      all_cards = []
      
      suits.each do |suit|
      all_cards << Card.new(:suit, "2", 2)
      all_cards << Card.new(:suit, "3", 3)
      all_cards << Card.new(:suit, "4", 4)
      all_cards << Card.new(:suit, "5", 5)
      all_cards << Card.new(:suit, "6", 6)
      all_cards << Card.new(:suit, "7", 7)
      all_cards << Card.new(:suit, "8", 8)
      all_cards << Card.new(:suit, "9", 9)
      all_cards << Card.new(:suit, "10", 10)
      all_cards << Card.new(:suit, "Jack", 11)
      all_cards << Card.new(:suit, "Queen", 12)
      all_cards << Card.new(:suit, "King", 13)
      all_cards << Card.new(:suit, "Ace", 14)
      end
      
      all_cards.shuffle!
      
      deck1 = Deck.new(all_cards[0...26])
      deck2 = Deck.new(all_cards[26..51])
      
      
      
      player1 = Player.new("Megan", deck1) 
      player2 = Player.new("Aurora", deck2)

      game = Game.new(player1, player2)

      expect(game).to be_instance_of(Game)
      expect(game.player1).to eq(player1)
      expect(game.player2).to eq(player2)
    end
  end
end