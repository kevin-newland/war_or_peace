class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2) 
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction 
    else 
      :war
    end
  end

  def winner # not sure if this is right
    if type == :basic 
      @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    elsif type == :war
      @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
      @player2
    elsif type == :mutually_assured_destruction
      @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      "No Winner"
    end
  end

  def pile_cards#can use if, elsif, elsif do not need to end with else
    if type == :basic
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    elsif type == :war #each player will send three cards (the top three cards) to the spoils pile
      @spoils_of_war << @player1.deck.cards.shift(3)
      @spoils_of_war << @player2.deck.cards.shift(3)
      @spoils_of_war.flatten! #needed to flatten array, was getting a array inside of array
    elsif type == :mutually_assured_destruction
      @player1.deck.cards.shift(3) # shift(n) → new_array Removes and returns leading elements. in this case we need to remove the first 3
      @player2.deck.cards.shift(3)
    end
  end

  def award_spoils(winner)
    @spoils_of_war.shuffle!#needed to prevent predictability to the game by shuffling the cards before awwarding them to the winner 
    winner.deck.cards.concat(@spoils_of_war)# concat: Adds to array all elements from each Array 
  end
end