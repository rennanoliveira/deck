require "deck"

describe Deck do
  it "should allow initialization with an array of cards" do
    expect { Deck.new([1,2,3]) }.to_not raise_error
  end
  it "should not allow initialization if given param is not array" do
    expect { Deck.new(1) }.to raise_error InitializeWithoutArrayException
  end

  describe "#empty?" do
    it "should return false if there are any cards in the deck" do
      deck = Deck.new([1])
      deck.empty?.should be_false
    end
    it "should return false if there are no cards in the deck" do
      deck = Deck.new([])
      deck.empty?.should be_true
    end
  end

  describe "#draw(amount)" do
    it "should take a card from the top of the deck if there is any" do
      top_card = "taken_card"
      middle_card = "middle_card"
      bottom_card = "bottom_card"
      deck = Deck.new([top_card, middle_card, bottom_card])
      draw = deck.draw(3)
      draw.should eql [top_card, middle_card, bottom_card]
    end
    it "should take only one card if no amount is given" do
      top_card = "taken_card"
      middle_card = "middle_card"
      bottom_card = "bottom_card"
      deck = Deck.new([top_card, middle_card, bottom_card])
      draw = deck.draw
      draw.should eql [top_card]
    end
    it "should raise exception if there are no cards to take" do
      deck = Deck.new([])
      expect { deck.draw }.to raise_error NotEnoughCardsException
    end
  end

  describe "#shuffle" do
    it "should shuffle the array of cards" do
      cards = [1,2,3,4]
      cards.should_receive :shuffle
      deck = Deck.new(cards)
      deck.shuffle
    end
  end

end