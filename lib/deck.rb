class Deck 
  attr_accessor :cards
                :index

  def initialize(cards)
    @cards = cards

  end

  def rank_of_card_at(cards)
    @cards = index.rank
  end
end