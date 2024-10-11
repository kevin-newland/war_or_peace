class Deck 
  attr_accessor :cards
                :rank
                :value

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.select { |card| card.rank >= 11} #change? check docs
  end

  def percent_high_ranking
   high_ranking_cards = @cards.select { |card| card.rank >= 11}
   expected_percentage = (high_ranking_cards.count.to_f/ @cards.count.to_f) * 100 
   expected_percentage.round(2)
  end 
#equation?
  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end 
end