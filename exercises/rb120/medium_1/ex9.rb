class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def <=>(other_object)
    value <=> other_object.value
  end
end

class Deck 
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_accessor :deck

  def initialize
    create_deck
  end

  def draw
    create_deck if deck.empty?
    deck.pop
  end

  private

  def create_deck
    @deck = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end

    deck.shuffle!
  end

  # def create_deck
  #   draw_new_deck
  #   shuffle
  # end

  # def draw_new_deck
  #   RANKS.each do |rank|
  #     SUITS.each do |suit|
  #       deck << Card.new(rank, suit)
  #     end
  #   end
  # end

  # def shuffle
  #   deck.shuffle!
  # end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }

puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.
