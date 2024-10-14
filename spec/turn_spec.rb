require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'rspec'
require 'pry'

RSpec.describe Turn do
  describe '#initialize' do
    it "is a instance of Turn" do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)  
      card4 = Card.new(:diamond, 'Jack', 11) 
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3) 
      card8 = Card.new(:diamond, '2', 2) 

      deck1 = Deck.new([card1, card2, card5, card8]) 
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new("Megan", deck1) 
      player2 = Player.new("Aurora", deck2)
      
      turn = Turn.new(player1, player2)
      exepct(turn).to eq(Turn)
    end
  end

  describe "Turn type basic"
    before(:each) do #before(:each) runs before every test (each it block), so each test gets a fresh setup.
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)  
      card4 = Card.new(:diamond, 'Jack', 11) 
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3) 
      card8 = Card.new(:diamond, '2', 2) 

      deck1 = Deck.new([card1, card2, card5, card8]) 
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new("Megan", deck1) 
      player2 = Player.new("Aurora", deck2)

      @turn = Turn.new(player1, player2)
    end

    describe '#type basic' do
      it 'is basic when the ranks of the first cards are not the same' do
        expect(@player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)).to be true
        expect(@turn).to eq(:basic)
      end
    end

    describe '#winner' do
      it 'will return whichever players first card is a higher rank' do
        winner = @turn.winner

        expect(@player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(2))
        expect(winner).to eq(@player1)
      end 
    end

    describe '#pile_cards' do
      it 'each player will send one card (the top card) to the spoils pile' do
        @turn.pile_cards

        expect(@turn.spoils_of_war).to eq([@card1, @card3])
        expect(@player1.deck).to eq([@card2, @card5, @card8])
        expect(@player2.deck).to eq(@card4, @card6, @card7)
      end
    end 
  end
  
  describe 'Turn type war' do
    before(:each) do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9) 
      card4 = Card.new(:diamond, 'Jack', 11) 
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)   
      card8 = Card.new(:diamond, '2', 2)
      
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)  
      
      @turn = Turn.new(player1, player2)
    end

    describe '#type war' do
      it 'occurs when both players first cards are equal' do
        expect(@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)).to be true
        expect(@turn).to eq(:war)
      end
    end

    describe '#winner' do
      it 'it will return whichever players third card is higher in rank' do 
        winner = @turn.winner

        expect(@player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2))
        expect(winner).to eq(@player2)
      end
    end

    describe '#pile_cards' do
      it 'each player will send three cards (the top three cards) to the spoils pile' do
        @turn.pile_cards

        expect(@turn.spoils_of_war).to eq([@card1, @card2, @card5, @card4, @card3, @card6])
        expect(@player1.deck).to eq([@card8])
        expect(@player2.deck).to eq([@card7])
      end
    end
  end

  describe 'Turn type mutually_assured_destruction' do
    before(:each) do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, '8', 8)
      card7 = Card.new(:heart, '3', 3) 
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7]) 

      player1 = Player.new("Megan", deck1) 
      player2 = Player.new("Aurora", deck2) 

      @turn = Turn.new(player1, player2)
    end

    describe '#type mutually_assured_destruction' do
      it "occurs when both players first and third card are equal" do
        expect(@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) &&
        @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)).to be true

        expect(@turn).to eq(:mutually_assured_destruction)
      end
    end 

    describe '#winner' do
      it 'the method will return No Winner' do
        winner = turn.winner

        expect(@deck1.cards).to eq(@deck2.cards)
        expect(winner).to be("No Winner")
      end
    end

    describe '#pile_cards' do
      it 'each player removes three cards and does not add them to spoils' do
        @turn.pile_cards

        expect(@turn.spoils_of_war).to eq([])
        expect(@player1.deck).to eq([])
        expect(@player2.deck).to eq([])
      end
    end
  end
  describe '#award_spoils' do
    it 'add each of the cards in the @spoils_of_war array to the winner of the turn.' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)  
      card4 = Card.new(:diamond, 'Jack', 11) 
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3) 
      card8 = Card.new(:diamond, '2', 2) 

      deck1 = Deck.new([card1, card2, card5, card8]) 
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new("Megan", deck1) 
      player2 = Player.new("Aurora", deck2)
      
      turn = Turn.new(player1, player2)

      winner = turn.winner
      expect(winner).to eq(@player1)

      turn.pile_cards
      expect(@turn.spoils_of_war).to eq([@card1, @card3])
      expect(@player1.deck).to eq([@card2, @card5, @card8])
      expect(@player2.deck).to eq(@card4, @card6, @card7)

      turn.award_spoils(winner)
      expect(@turn.spoils_of_war).to eq([])
      expect(@player1.deck).to eq([@card2, @card5, @card8, @card1, @card3])
      expect(@player2.deck).to eq(@card4, @card6, @card7)
    end 
  end 
  # binding.pry
end