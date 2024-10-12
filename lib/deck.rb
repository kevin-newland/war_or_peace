class Deck 
  attr_accessor :cards    # allows both reading and modifying to be done to the array of cards from outside the class
                :rank     #attribute 
                :value    #attribute

  def initialize(cards) # takes an array of cards in the form of an argumantand assigns it to the @cards instance variable 
    @cards = cards  
  end

  def rank_of_card_at(index)# accesses the card at the given index in @cards and returns the rank of that card
    @cards[index].rank #accessing a array of cards and retrieving the rank by using a index
  end

  def high_ranking_cards #returns an array with only high ranking cards
    @cards.select { |card| card.rank >= 11} #filters through @cards array returnig a new array containing only cards whos rank is 11 or greater
  end  

  def percent_high_ranking #this method calculates and returns the percentage of high-ranking cards in the deck, rounded to two decimal places.

   high_ranking_cards = @cards.select { |card| card.rank >= 11}
   expected_percentage = (high_ranking_cards.count.to_f/ @cards.count.to_f) * 100 # calculates
   expected_percentage.round(2)
  end 

  def remove_card
    @cards.shift #.shift takes the first element out of the array and returns it 
  end

  def add_card(card)
    @cards << card
  end 
end