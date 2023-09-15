require 'pry'

require 'yaml'
MESSAGES = YAML.load_file('twenty_one.yml')
CARD_VALUES = {
  '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
  '8' => 8, '9' => 9, '1' => 10, 'J' => 10, 'Q' => 10,
  'K' => 10, 'A' => 11
}
NUMBER_CONVERSION = {
  '2' => 'Two', '3' => 'Three', '4' => 'Four', '5' => 'Five', '6' => 'Six',
  '7' => 'Seven', '8' => 'Eight', '9' => 'Nine', '1' => 'Ten', 'J' => 'Jack',
  'Q' => 'Queen', 'K' => 'King', 'A' => 'Ace'
}
SUIT_CONVERSION = {
  'H' => 'Hearts', 'D' => 'Diamonds', 'C' => 'Clubs', 'S' => 'Spades'
}
DEALER_MIN_TOTAL = 17
MAX_TOTAL = 21

def prompt(string)
  puts(">> #{string}")
end

def display_intro_messages
  puts MESSAGES['welcome']
  gets
  puts MESSAGES['card_explanation']
  gets
  puts MESSAGES['player_turn_rules']
  gets
  puts MESSAGES['dealer_turn_rules']
  gets
end

def initialize_deck
  suits = %w(H D C S)
  cards = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  new_deck = []
  suits.each do |suit|
    cards.each do |card|
      new_deck << "#{card}#{suit}"
    end
  end
  new_deck
end

def update_total!(current_player_symbol, current_player_cards, totals_hash)
  totals_hash[current_player_symbol] = 0
  current_player_cards.each do |card|
    totals_hash[current_player_symbol] += CARD_VALUES[card[0]]
  end
  number_of_aces = 0
  current_player_cards.each { |card| number_of_aces += 1 if card[0] == 'A' }
  if totals_hash[current_player_symbol] > MAX_TOTAL && number_of_aces > 0
    number_of_aces.times do
      totals_hash[current_player_symbol] -= 10
      break if totals_hash[current_player_symbol] <= MAX_TOTAL
    end
  end
end

def deal_card!(character_cards, deck)
  character_cards << deck.sample
  deck.delete(character_cards.last)
end

def deal_initial_cards(deck, player_cards, dealer_cards, totals)
  2.times { deal_card!(player_cards, deck) }
  2.times { deal_card!(dealer_cards, deck) }
  update_total!(:player_total, player_cards, totals)
  update_total!(:dealer_total, dealer_cards, totals)
end

def display_cards_text(cards)
  text = []
  cards.each do |card|
    text << "#{NUMBER_CONVERSION[card[0]]} of #{SUIT_CONVERSION[card[-1]]}"
  end
  text.join(', ')
end

def display_top_card_number(cards)
  cards.each do |card|
    case card[0]
    when '1' then print "|#{card[0..1]}   | "
    else print "|#{card[0]}    | "
    end
  end
end

def display_card_suit(cards)
  cards.each do |card|
    case card[0]
    when '1' then print "|  #{card[2]}  | "
    else print "|  #{card[1]}  | "
    end
  end
end

def display_bottom_card_number(cards)
  cards.each do |card|
    case card[0]
    when '1' then print "|   #{card[0..1]}| "
    else print "|    #{card[0]}| "
    end
  end
end

def display_all_cards(cards)
  cards.count { print '+-----+ ' }
  puts
  display_top_card_number(cards)
  puts
  display_card_suit(cards)
  puts
  display_bottom_card_number(cards)
  puts
  cards.count { print '+-----+ ' }
  puts
end

def blackjack?(current_player_cards, current_player_total)
  current_player_cards.size == 2 && current_player_total == MAX_TOTAL
end

def both_blackjack?(player_cards, dealer_cards, totals)
  blackjack?(player_cards, totals[:player_total]) &&
    blackjack?(dealer_cards, totals[:dealer_total])
end

def either_blackjack?(player_cards, dealer_cards, totals)
  blackjack?(player_cards, totals[:player_total]) ||
    blackjack?(dealer_cards, totals[:dealer_total])
end

def display_initial_player_blackjack_text(player_cards, dealer_cards)
  prompt "Your cards are: #{display_cards_text(player_cards)}."
  display_all_cards(player_cards)
  prompt "You got a blackjack! If the dealer doesn't get blackjack, you win!"
  prompt "Press any key to continue."
  gets
  prompt "The dealer's cards are: #{display_cards_text(dealer_cards)}."
  display_all_cards(dealer_cards)
end

def display_both_blackjack(player_cards, dealer_cards)
  display_initial_player_blackjack_text(player_cards, dealer_cards)
  prompt "They also have blackjack! It is a push!"
  prompt "Press any key to continue."
  gets
end

def display_player_blackjack_text(player_cards, dealer_cards)
  display_initial_player_blackjack_text(player_cards, dealer_cards)
  prompt "They don't have a blackjack, you win!"
  prompt "Press any key to continue."
  gets
end

def display_dealer_blackjack_text(player_cards, dealer_cards)
  prompt "Your cards are: #{display_cards_text(player_cards)}."
  display_all_cards(player_cards)
  prompt "The dealer's cards are: #{display_cards_text(dealer_cards)}."
  display_all_cards(dealer_cards)
  prompt "The dealer has a blackjack and wins!"
  prompt "Press any key to continue."
  gets
end

def check_for_blackjacks(player_cards, dealer_cards, totals)
  if both_blackjack?(player_cards, dealer_cards, totals)
    display_both_blackjack(player_cards, dealer_cards)
  elsif blackjack?(player_cards, totals[:player_total])
    display_player_blackjack_text(player_cards, dealer_cards)
  elsif blackjack?(dealer_cards, totals[:dealer_total])
    display_dealer_blackjack_text(player_cards, dealer_cards)
  end
end

def display_a_or_an(cards)
  if NUMBER_CONVERSION[cards[0][0]].start_with?(/[aeiou]/i)
    'an'
  else
    'a'
  end
end

def display_initial_cards(player_cards, dealer_cards)
  prompt "The dealer's visible card is #{display_a_or_an(dealer_cards)} #{display_cards_text(dealer_cards[0].split)}."
  display_all_cards(dealer_cards[0].split)
  prompt "Your cards are: #{display_cards_text(player_cards)}"
  display_all_cards(player_cards)
end

def display_dealer_cards(dealer_cards, totals)
  prompt "The dealer's cards are: #{display_cards_text(dealer_cards)}."
  display_all_cards(dealer_cards)
  prompt "The dealer's total is #{totals[:dealer_total]}."
end

def hit_or_stay(totals)
  prompt "Your total is #{totals[:player_total]}. Would you like to hit (h) or stay (s)?"
  loop do
    choice = gets.chomp.downcase[0]
    case choice
    when 'h' then return 'hit'
    when 's' then return 'stay'
    else prompt "Invalid answer, please choose hit (h) or stay (s)."
    end
  end
end

def hit!(current_player_cards, deck, totals_hash, current_player_symbol)
  deal_card!(current_player_cards, deck)
  update_total!(current_player_symbol, current_player_cards, totals_hash)
end

def display_new_card(current_player, current_player_cards)
  if current_player == 'player'
    prompt "You drew #{display_a_or_an(current_player_cards.last)} #{display_cards_text(current_player_cards.last.split)}."
    prompt "Your cards are: #{display_cards_text(current_player_cards)}."
  elsif current_player == 'dealer'
    prompt "The dealer drew #{display_a_or_an(current_player_cards.last)} #{display_cards_text(current_player_cards.last.split)}."
    prompt "The dealer's cards are #{display_cards_text(current_player_cards)}."
  end
end

def display_current_total(current_player, current_player_cards, totals)
  display_all_cards(current_player_cards)
  if current_player == 'player'
    prompt "Your total is #{totals[:player_total]}."
  else
    prompt "The dealer's total is #{totals[:dealer_total]}."
  end
end

def display_card_drawing(current_player, current_player_cards, totals)
  display_new_card(current_player, current_player_cards)
  display_current_total(current_player, current_player_cards, totals)
end

def player_turn(player_cards, dealer_cards, deck, totals)
  display_initial_cards(player_cards, dealer_cards)
  loop do
    player_choice = hit_or_stay(totals)
    break if player_choice == 'stay'
    hit!(player_cards, deck, totals, :player_total)
    display_card_drawing('player', player_cards, totals)
    break if totals[:player_total] > MAX_TOTAL
  end
end

def dealer_turn(dealer_cards, deck, totals)
  display_dealer_cards(dealer_cards, totals)
  loop do
    break if totals[:dealer_total] >= DEALER_MIN_TOTAL
    puts MESSAGES['dealer_hits_prompt']
    gets
    hit!(dealer_cards, deck, totals, :dealer_total)
    display_card_drawing('dealer', dealer_cards, totals)
  end
end

def busted?(current_player, totals)
  if current_player == 'player'
    totals[:player_total] > MAX_TOTAL
  elsif current_player == 'dealer'
    totals[:dealer_total] > MAX_TOTAL
  end
end

def display_busted_text(totals)
  prompt "You busted, the dealer wins!" if totals[:player_total] > MAX_TOTAL
  prompt "The dealer busts, you win!" if totals[:dealer_total] > MAX_TOTAL
end

def determine_winner(totals_hash)
  if totals_hash[:dealer_total] > MAX_TOTAL then 'player'
  elsif totals_hash[:player_total] > MAX_TOTAL then 'dealer'
  elsif totals_hash[:player_total] > totals_hash[:dealer_total] then 'player'
  elsif totals_hash[:dealer_total] > totals_hash[:player_total] then 'dealer'
  else
    'push'
  end
end

def increment_scores!(winner, score)
  case winner
  when 'player' then score[:player_score] += 1
  when 'dealer' then score[:dealer_score] += 1
  end
end

def display_final_totals(totals)
  prompt "Time to compare compare totals, press any key to continue."
  gets
  prompt "Your total is #{totals[:player_total]}, the dealer's total is #{totals[:dealer_total]}."
end

def display_winner(winner)
  case winner
  when 'player' then prompt 'You win!'
  when 'dealer' then prompt 'The dealer wins!'
  else prompt "It's a push!"
  end
end

def winner_already_delcared?(player_cards, dealer_cards, totals)
  busted?('player', totals) || busted?('dealer', totals) ||
    either_blackjack?(player_cards, dealer_cards, totals)
end

def play_again?
  prompt "Do you want to play again? (y/n)"
  play_again = gets.chomp
  play_again.downcase.start_with?('y')
end

system 'clear'

display_intro_messages

score = { player_score: 0, dealer_score: 0 }

loop do
  system 'clear'

  deck = initialize_deck
  player_cards = []
  dealer_cards = []
  totals = { player_total: 0, dealer_total: 0 }

  deal_initial_cards(deck, player_cards, dealer_cards, totals)

  1.times do
    check_for_blackjacks(player_cards, dealer_cards, totals)
    break if either_blackjack?(player_cards, dealer_cards, totals)

    player_turn(player_cards, dealer_cards, deck, totals)
    display_busted_text(totals) if busted?('player', totals)
    break if busted?('player', totals)

    dealer_turn(dealer_cards, deck, totals)
    display_busted_text(totals) if busted?('dealer', totals)
    break if busted?('dealer', totals)
  end

  winner = determine_winner(totals)
  increment_scores!(winner, score)
  unless winner_already_delcared?(player_cards, dealer_cards, totals)
    display_final_totals(totals)
    display_winner(winner)
  end
  prompt "The score is player: #{score[:player_score]}, dealer: #{score[:dealer_score]}."
  break unless play_again?
end

prompt "Thanks for playing, goodbye!"
