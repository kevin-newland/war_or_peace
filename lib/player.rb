class Player 
  attr_accessor :name, 
                :deck
                
              
  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?# ? means boolean
    @deck.cards.empty? 
  end
end 