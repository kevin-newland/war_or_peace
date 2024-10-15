require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

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
#... means up to and including  , .. means not including #look up more on ranges
deck1 = Deck.new(all_cards[0...26])
deck2 = Deck.new(all_cards[26..51])



player1 = Player.new("Megan", deck1) 
player2 = Player.new("Aurora", deck2)

puts "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------"""