module DisplayMessages
  def display_player_end_of_turn_message
    if busted?
      puts "Your total is #{total}! You busted!"
    else
      puts "Your final total is #{total}. Now it's the dealer's turn."
    end
    puts "Press enter to continue"
    gets
  end

  def display_dealer_choice
    choice = if total < 17
               'hits'
             elsif total >= 17
               'stays'
             end

    puts "The dealer's total is #{total}. The dealer #{choice}."
    puts "Press enter to continue."
    gets
  end

  def display_dealer_end_of_turn_message
    if busted?
      puts "The dealer's total is #{total}. The dealer busts!"
    else
      puts "Time to compare totals!"
    end
    puts "Press enter to continue."
    gets
  end

  def display_rules?
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Invalid Input, type 'y' to see the rules or 'n' to start the game."
    end
    clear_screen
    answer == 'y'
  end

  MESSAGES = YAML.load_file('oo_twenty_one.yml')

  def display_rules
    puts MESSAGES['rules_intro']
    gets
    puts MESSAGES['card_values']
    gets
    puts MESSAGES['player_turn']
    gets
    puts MESSAGES['dealer_turn']
    gets
    puts MESSAGES['winning']
    gets
  end

  def display_result
    display_all_cards(player, dealer)
    update_score
    display_winner
  end

  def display_game_over_message(score)
    puts
    return unless champion
    winner = score.key(Game::CHAMPION_NUM)
    rounds = Game::CHAMPION_NUM
    puts "#{winner} won #{rounds} rounds first and is the champion!"
  end

  def display_goodbye_message
    puts "Thanks for playing Twenty-one! Goodbye!"
  end

  private

  def display_winner
    player_score = score[player.name]
    dealer_score = score[dealer.name]
    display_round_result
    puts "The score is #{player.name}: #{player_score}, Dealer: #{dealer_score}"
  end

  def display_round_result
    name = player.name
    puts "The totals are #{name}: #{player.total}, Dealer: #{dealer.total}"
    if push
      puts "It's a push!"
    else
      puts "#{winner} wins!"
    end
  end
end

module DisplayCards
  def display_hand
    hand.count { print "+-----+ " }
    puts
    display_top_numbers
    puts
    display_suits
    puts
    display_bottom_numbers
    puts
    hand.count { print "+-----+ " }
    puts
  end

  private

  def display_top_numbers
    hand.each do |card|
      if card.rank == "10"
        print "|#{card.rank}   | "
      else
        print "|#{card.rank}    | "
      end
    end
  end

  def display_bottom_numbers
    hand.each do |card|
      if card.rank == "10"
        print "|   #{card.rank}| "
      else
        print "|    #{card.rank}| "
      end
    end
  end

  def display_suits
    hand.each do |card|
      print "|  #{card.suit}  | "
    end
  end

  def display_all_cards(player, dealer)
    clear_screen
    puts "Your cards are:"
    player.display_hand
    if dealer.hand.size == 1
      puts "The dealer's visible card is:"
    else
      puts "The dealer's cards are:"
    end
    dealer.display_hand
    puts "------------------------"
  end
end

class Participant
  include DisplayMessages

  BUSTED_NUMBER = 21

  attr_reader :name
  attr_accessor :hand, :total

  def initialize(name)
    @name = name
    @hand = []
    @total = 0
  end

  def busted?
    total >= BUSTED_NUMBER
  end

  def update_total
    total = hand.map(&:value).sum
    aces_one_or_eleven(total)
  end

  private

  def aces_one_or_eleven(total)
    aces = 0
    hand.each { |card| aces += 1 if card.rank == 'A' }
    if total > 21 && aces > 0
      loop do
        total -= 10
        aces -= 1
        break if total <= 21 || aces == 0
      end
    end
    total
  end

  def clear_screen
    system 'clear'
  end
end

class Player < Participant
  include DisplayCards

  attr_writer :name

  def turn(dealer)
    clear_screen
    hit_or_stay(self, dealer)
    display_player_end_of_turn_message
  end

  private

  def choose_hit_or_stay?
    answer = nil
    loop do
      puts "Your total is #{total}. Do you want to hit? (y/n):"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Invalid Input"
    end
    false unless answer == 'y'
  end

  def hit_or_stay(player, dealer)
    loop do
      display_all_cards(player, dealer)
      break if busted?
      choice = choose_hit_or_stay?
      break if choice == false
      dealer.deal_card(hand)
      @total = update_total
    end
  end
end

class Dealer < Participant
  include DisplayCards
  attr_accessor :deck, :hidden_card

  def initialize(name)
    super
    @deck = Deck.new
    @hidden_card = []
  end

  def deal_initial_cards(player)
    2.times { deal_card(player.hand) }
    deal_card(hidden_card)
    deal_card(hand)
  end

  def deal_card(hand)
    card = deck.remaining_cards.sample
    hand << card
    deck.remaining_cards.delete(card)
  end

  def turn(player)
    clear_screen
    put_hidden_card_in_hand
    return if player.busted?
    hit_or_stay(player, self)
    display_dealer_end_of_turn_message
    clear_screen
  end

  private

  def put_hidden_card_in_hand
    hand << hidden_card[0]
    @total = update_total
  end

  def hit_or_stay(player, dealer)
    loop do
      display_all_cards(player, dealer)
      break if busted?
      choice = choose_hit_or_stay?
      display_dealer_choice
      break if choice == false
      deal_card(hand)
      @total = update_total
    end
  end

  def choose_hit_or_stay?
    return true if total < 17
    false
  end
end

class Deck
  attr_accessor :remaining_cards

  def initialize
    @remaining_cards = new_deck
  end

  private

  def new_deck
    deck = []
    Card::NUMBERS.each do |rank, value|
      Card::SUITS.each do |suit|
        deck << Card.new(rank, value, suit)
      end
    end
    deck
  end
end

class Card
  SUITS = ["\u2660", "\u2663", "\u2665", "\u2666"]
  NUMBERS = {
    "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8,
    "9" => 9, "10" => 10, "J" => 10, "Q" => 10, "K" => 10, "A" => 11
  }

  attr_reader :rank, :suit, :value

  def initialize(rank, value, suit)
    @rank = rank
    @value = value
    @suit = suit
  end
end

class Game
  include DisplayMessages
  include DisplayCards

  CHAMPION_NUM = 3

  attr_reader :player, :dealer, :score

  def initialize
    @player = Player.new(nil)
    @dealer = Dealer.new('Dealer')
  end

  def start
    game_intro
    entire_game
    display_goodbye_message
  end

  private

  def entire_game
    loop do
      main_gameplay
      display_game_over_message(score)
      break unless champion && play_again?
      reset_game
    end
  end

  def main_gameplay
    loop do
      dealer.deal_initial_cards(player)
      display_all_cards(player, dealer)
      update_totals
      player.turn(dealer)
      dealer.turn(player)
      display_result
      break unless new_round?
      reset_round
    end
  end

  def game_intro
    clear_screen
    choose_name
    prompt_rules
    set_scoreboard
  end

  def choose_name
    puts "Welcome to Twenty-One! What is your name?"
    name = nil
    loop do
      name = gets.chomp.strip.capitalize
      break unless name.empty?
      puts "Sorry, you must enter at least one character."
    end
    player.name = name
  end

  def prompt_rules
    puts "Do you want to see the rules? (y/n):"
    unless display_rules?
      puts "Let's begin! Press enter to start."
      gets
      return
    end
    display_rules
  end

  def set_scoreboard
    @score = { player.name => 0, dealer.name => 0 }
  end

  def update_totals
    player.total = player.update_total
    dealer.total = dealer.update_total
  end

  def update_score
    return if push
    score[player.name] += 1 if winner == player.name
    score[dealer.name] += 1 if winner == dealer.name
  end

  def winner
    if player.busted? || dealer.busted?
      winner_from_bust
    else
      winner_from_points
    end
  end

  def winner_from_bust
    if dealer.busted?
      player.name
    elsif player.busted?
      dealer.name
    end
  end

  def winner_from_points
    if player.total > dealer.total
      player.name
    elsif player.total < dealer.total
      dealer.name
    end
  end

  def push
    player.total == dealer.total
  end

  def new_round?
    return false if champion
    return true if play_again?
  end

  def champion
    champion = nil
    champion = score.key(CHAMPION_NUM) if score.values.include?(CHAMPION_NUM)
    champion
  end

  def play_again?
    puts
    answer = nil
    loop do
      puts "Do you want to play again? (y/n):"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Invalud Input"
    end
    answer == 'y'
  end

  def reset_round
    dealer.deck = Deck.new
    player.hand = []
    dealer.hand = []
    dealer.hidden_card = []
  end

  def reset_game
    set_scoreboard
    reset_round
  end

  def clear_screen
    system 'clear'
  end
end

Game.new.start
