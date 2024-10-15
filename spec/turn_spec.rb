require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'rspec'
require 'pry'
#@ symbol is used to denote instance variables. Instance variables are variables that belong to a particular object (or instance) of a class, and they can be used to store values that are available across different methods of the object.
RSpec.describe Turn do
  describe '#initialize' do
    before(:each) do
      @card1 = Card.new(:heart, 'Jack', 11)
      @card2 = Card.new(:heart, '10', 10)
      @card3 = Card.new(:heart, '9', 9)  
      @card4 = Card.new(:diamond, 'Jack', 11) 
      @card5 = Card.new(:heart, '8', 8)
      @card6 = Card.new(:diamond, 'Queen', 12)
      @card7 = Card.new(:heart, '3', 3) 
      @card8 = Card.new(:diamond, '2', 2) 

      @deck1 = Deck.new([@card1, @card2, @card5, @card8]) 
      @deck2 = Deck.new([@card3, @card4, @card6, @card7])
      
      @player1 = Player.new("Megan", @deck1) 
      @player2 = Player.new("Aurora", @deck2)
      
      @turn = Turn.new(@player1, @player2)
      
    end

    it 'has turn' do#needed its own test block
      expect(@turn).to be_a(Turn)
    end

    it 'is created with 2 players' do#needed its own test block
      expect(@turn.player1).to eq(@player1)
      expect(@turn.player2).to eq(@player2)
    end

    it 'has spoils of war starts empty' do#needed its own test block
      expect(@turn.spoils_of_war).to eq([])
    end
  end

  describe "Turn type basic" do
    before(:each) do #before(:each) runs before every test (each it block), so each test gets a fresh setup.
      @card1 = Card.new(:heart, 'Jack', 11)
      @card2 = Card.new(:heart, '10', 10)
      @card3 = Card.new(:heart, '9', 9)  
      @card4 = Card.new(:diamond, 'Jack', 11) 
      @card5 = Card.new(:heart, '8', 8)
      @card6 = Card.new(:diamond, 'Queen', 12)
      @card7 = Card.new(:heart, '3', 3) 
      @card8 = Card.new(:diamond, '2', 2) 

      @deck1 = Deck.new([@card1, @card2, @card5, @card8]) 
      @deck2 = Deck.new([@card3, @card4, @card6, @card7])

      @player1 = Player.new("Megan", @deck1) 
      @player2 = Player.new("Aurora", @deck2)

      @turn = Turn.new(@player1, @player2)
    end

    describe '#type basic' do
      it 'is basic when the ranks of the first cards are not the same' do
        expect(@player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)).to be true
        expect(@turn.type).to eq(:basic)#needed .type
      end
    end

    describe '#winner' do
      it 'will return whichever players first card is a higher rank' do
        winner = @turn.winner

        expect(@player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0))
        expect(winner).to eq(@player1)
      end 
    end

    describe '#pile_cards' do
      it 'each player will send one card (the top card) to the spoils pile' do
        @turn.pile_cards

        expect(@turn.spoils_of_war).to eq([@card1, @card3])
        expect(@player1.deck.cards).to eq([@card2, @card5, @card8])#was missing .cards getter method(needs this to access the cards in the deck)
        expect(@player2.deck.cards).to eq([@card4, @card6, @card7])
      end
    end 
  end
  
  describe 'Turn type war' do
    before(:each) do
      @card1 = Card.new(:heart, 'Jack', 11)
      @card2 = Card.new(:heart, '10', 10)
      @card3 = Card.new(:heart, '9', 9) 
      @card4 = Card.new(:diamond, 'Jack', 11) 
      @card5 = Card.new(:heart, '8', 8)
      @card6 = Card.new(:diamond, 'Queen', 12)
      @card7 = Card.new(:heart, '3', 3)   
      @card8 = Card.new(:diamond, '2', 2)
      
      @deck1 = Deck.new([@card1, @card2, @card5, @card8])
      @deck2 = Deck.new([@card4, @card3, @card6, @card7])

      @player1 = Player.new("Megan", @deck1)
      @player2 = Player.new("Aurora", @deck2)  
      
      @turn = Turn.new(@player1, @player2)
    end

    describe '#type war' do
      it 'occurs when both players first cards are equal' do
        expect(@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)).to be true
        expect(@turn.type).to eq(:war)#needed .type
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
        expect(@player1.deck.cards).to eq([@card8])
        expect(@player2.deck.cards).to eq([@card7])
      end
    end
  end

  describe 'Turn type mutually_assured_destruction' do
    before(:each) do
      @card1 = Card.new(:heart, 'Jack', 11)
      @card2 = Card.new(:heart, '10', 10)
      @card3 = Card.new(:heart, '9', 9)
      @card4 = Card.new(:diamond, 'Jack', 11)
      @card5 = Card.new(:heart, '8', 8)
      @card6 = Card.new(:diamond, '8', 8)
      @card7 = Card.new(:heart, '3', 3) 
      @card8 = Card.new(:diamond, '2', 2)

      @deck1 = Deck.new([@card1, @card2, @card5, @card8])
      @deck2 = Deck.new([@card4, @card3, @card6, @card7]) 

      @player1 = Player.new("Megan", @deck1) 
      @player2 = Player.new("Aurora", @deck2) 

      @turn = Turn.new(@player1, @player2)
    end

    describe '#type mutually_assured_destruction' do
      it "occurs when both players first and third card are equal" do
        expect(@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)).to be true

        expect(@turn.type).to eq(:mutually_assured_destruction)#needed .type
      end
    end 

    describe '#winner' do
      it 'the method will return No Winner' do
        winner = @turn.winner

        expect(@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)).to be true
        expect(winner).to eq("No Winner")
      end
    end

    describe '#pile_cards' do
      it 'each player removes three cards and does not add them to spoils' do
        @turn.pile_cards
        
        expect(@turn.spoils_of_war).to eq([])
        expect(@player1.deck.cards).to eq([@card8])
        expect(@player2.deck.cards).to eq([@card7])
      end
    end
  end
  describe '#award_spoils' do
    it 'add each of the cards in the @spoils_of_war array to the winner of the turn.' do 
      @card1 = Card.new(:heart, 'Jack', 11)
      @card2 = Card.new(:heart, '10', 10)
      @card3 = Card.new(:heart, '9', 9)  
      @card4 = Card.new(:diamond, 'Jack', 11) 
      @card5 = Card.new(:heart, '8', 8)
      @card6 = Card.new(:diamond, 'Queen', 12)
      @card7 = Card.new(:heart, '3', 3) 
      @card8 = Card.new(:diamond, '2', 2) 

      @deck1 = Deck.new([@card1, @card2, @card5, @card8]) 
      @deck2 = Deck.new([@card3, @card4, @card6, @card7])

      @player1 = Player.new("Megan", @deck1) 
      @player2 = Player.new("Aurora", @deck2)
      
      @turn = Turn.new(@player1, @player2)

      winner = @turn.winner
      expect(winner).to eq(@player1)

      @turn.pile_cards
      expect(@turn.spoils_of_war).to eq([@card1, @card3])
      expect(@player1.deck.cards).to eq([@card2, @card5, @card8])
      expect(@player2.deck.cards).to eq([@card4, @card6, @card7])

      @turn.award_spoils(winner)
      expect(@player1.deck.cards).to eq([@card2, @card5, @card8, @card1, @card3])
      expect(@player2.deck.cards).to eq([@card4, @card6, @card7])
    end 
  end 
  # binding.pry
end