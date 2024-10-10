class Deck 
  attr_accessor :cards
                :rank

  def initialize(cards)
    @cards = cards

  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards >= 11
  end

  def percent_high_ranking

  end 

  def remove_card

  end

  def add_card

  end 
end