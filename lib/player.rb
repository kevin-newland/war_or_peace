class Player 
  attr_accessor :name, #allows reading and modifying to be available to the attributes listed 
                :deck
                
              
  def initialize(name, deck)# takes the name of the player and the players deck in form of arguments
    @name = name
    @deck = deck
  end

  def has_lost? # ? means boolean
    @deck.cards.empty? # checks to see if the cards in the deck are empty(returns true if empty, false if not)
  end
end 