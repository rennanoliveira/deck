require 'exceptions'
class Deck
  attr_writer :cards

  def initialize(array_of_cards)
    if array_of_cards.is_a? Array
      @cards = array_of_cards
    else
      raise InitializeWithoutArrayException
    end
  end

  def empty?
    @cards.empty?
  end

  def draw(amount=1)
    if amount > @cards.size
      raise NotEnoughCardsException
    else
      @cards.shift(amount)
    end
  end

  def shuffle
    @cards.shuffle
  end

end