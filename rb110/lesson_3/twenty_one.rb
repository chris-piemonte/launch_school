require 'yaml'
MESSAGES = YAML.load_file('twenty_one.yml')
CARD_VALUES = {
  'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5, 'six' => 6, 'seven' => 7,
  'eight' => 8, 'nine' => 9, 'ten' => 10, 'jack' => 10, 'queen' => 10,
  'king' => 10, 'ace' => 11
}
DEALER_MIN_TOTAL = 17
MAX_TOTAL = 21

def prompt(string)
  puts(">> #{string}")
end

def update_total!(character_cards, totals, character)
  totals[character] = 0
  character_cards.each { |card| totals[character] += CARD_VALUES[card] }
  if totals[character] > MAX_TOTAL && character_cards.include?('ace')
    number_of_aces = character_cards.count('ace')
    number_of_aces.times do
      totals[character] -= 10
      break if totals[character] <= MAX_TOTAL
    end
  end
end

def update_deck!(deck, cards_remaining)
  deck.clear
  cards_remaining.each do |card, number|
    number.times { deck << card }
  end
end

def deal_card!(character_cards, deck, cards_remaining)
  character_cards << deck.sample
  cards_remaining[character_cards.last] -= 1
  update_deck!(deck, cards_remaining)
end

def blackjack?(character_cards, character_total)
  character_cards.size == 2 && character_total == MAX_TOTAL
end

def display_both_blackjack(player_cards, dealer_cards)
  prompt "Your cards are: #{player_cards.join(', ')}. You got a blackjack!"
  prompt "If the dealer doesn't get blackjack, you win!"
  prompt "Press any key to continue."
  gets
  prompt "The dealer's cards are: #{dealer_cards.join(', ')}."
  prompt "They also have blackjack! It is a push!"
  prompt "Press any key to continue."
  gets
end

def player_blackjack(player_cards, dealer_cards, score)
  score[:player_score] += 1
  prompt "Your cards are: #{player_cards.join(', ')}. You got a blackjack!"
  prompt "If the dealer doesn't get blackjack you win!"
  prompt "Press any key to continue."
  gets
  prompt "The dealer's cards are: #{dealer_cards.join(', ')}."
  prompt "They don't have a blackjack, you win!"
  prompt "Press any key to continue."
  gets
end

def dealer_blackjack(player_cards, dealer_cards, score)
  score[:dealer_score] += 1
  prompt "Your cards are: #{player_cards.join(', ')}."
  prompt "The dealer's cards are: #{dealer_cards.join(', ')}. The dealer has a blackjack and wins!"
  prompt "Press any key to continue."
  gets
end

def display_initial_cards(player_cards, dealer_cards)
  prompt "The dealer's visible card is a(n): #{dealer_cards.sample}."
  prompt "Your cards are: #{player_cards.join(', ')}."
end

def display_dealer_cards(dealer_cards, totals)
  prompt "The dealer's cards are: #{dealer_cards.join(', ')}."
  prompt "The dealer's total is #{totals[:dealer_total]}."
end

def hit_or_stay
  loop do
    choice = gets.chomp.downcase[0]
    case choice
    when 'h' then return 'hit'
    when 's' then return 'stay'
    else prompt "Invalid answer, please choose hit (h) or stay (s)."
    end
  end
end

def hit!(character_cards, deck, cards_remaining, totals, character)
  deal_card!(character_cards, deck, cards_remaining)
  update_total!(character_cards, totals, character)
end

def player_new_hand!(player_cards, totals, score)
  prompt "You drew a #{player_cards.last}, your cards are #{player_cards.join(', ')}."
  if totals[:player_total] > MAX_TOTAL
    prompt "Your total is #{totals[:player_total]}, you busted!"
    score[:dealer_score] += 1
  end
end

def dealer_new_hand!(dealer_cards, totals, score)
  display_dealer_cards(dealer_cards, totals)
  if totals[:dealer_total] > MAX_TOTAL
    prompt "The dealer busts, you win!"
    score[:player_score] += 1
  end
end

def display_final_comparison_prompt(totals)
  prompt "Time to compare compare totals, press any key to continue."
  gets
  prompt "Your total is #{totals[:player_total]}, the dealer's total is #{totals[:dealer_total]}."
end

def determine_winner!(totals, score)
  if totals[:player_total] > totals[:dealer_total]
    score[:player_score] += 1
    prompt "You win!"
  elsif totals[:player_total] < totals[:dealer_total]
    score[:dealer_score] += 1
    prompt "The dealer wins!"
  else
    prompt "It's a push!"
  end
end

def play_again?
  prompt "Do you want to play again? (y/n)"
  play_again = gets.chomp
  play_again.downcase.start_with?('y')
end

system 'clear'
puts MESSAGES['welcome']
gets
puts MESSAGES['card_explanation']
gets
puts MESSAGES['player_turn_rules']
gets
puts MESSAGES['dealer_turn_rules']
gets

score = { player_score: 0, dealer_score: 0 }

# entire game loop
loop do
  system 'clear'

  cards_remaining = {
    'two' => 4, 'three' => 4, 'four' => 4, 'five' => 4, 'six' => 4,
    'seven' => 4, 'eight' => 4, 'nine' => 4, 'ten' => 4, 'jack' => 4,
    'queen' => 4, 'king' => 4, 'ace' => 4
  }

  deck = []
  player_cards = []
  dealer_cards = []
  totals = { player_total: 0, dealer_total: 0 }

  update_deck!(deck, cards_remaining)
  2.times { deal_card!(player_cards, deck, cards_remaining) }
  2.times { deal_card!(dealer_cards, deck, cards_remaining) }
  update_total!(player_cards, totals, :player_total)
  update_total!(dealer_cards, totals, :dealer_total)

  # main game
  1.times do

    # Check for blackjacks
    if blackjack?(player_cards, totals[:player_total]) && blackjack?(dealer_cards, totals[:dealer_total])
      display_both_blackjack(player_cards, dealer_cards)
      break
    elsif blackjack?(player_cards, totals[:player_total])
      player_blackjack(player_cards, dealer_cards, score)
      break
    elsif blackjack?(dealer_cards, totals[:dealer_total])
      dealer_blackjack(player_cards, dealer_cards, score)
      break
    end
    # end of blackjack check

    # player turn
    display_initial_cards(player_cards, dealer_cards)
    loop do
      prompt "Your total is #{totals[:player_total]}. Would you like to hit (h) or stay (s)?"
      player_choice = hit_or_stay
      break if player_choice == 'stay'
      hit!(player_cards, deck, cards_remaining, totals, :player_total)
      player_new_hand!(player_cards, totals, score)
      break if totals[:player_total] > MAX_TOTAL
    end
    # end of player turn

    break if totals[:player_total] > MAX_TOTAL

    # dealer turn
    display_dealer_cards(dealer_cards, totals)
    loop do
      break if totals[:dealer_total] >= DEALER_MIN_TOTAL
      puts MESSAGES['dealer_hits_prompt']
      gets
      hit!(dealer_cards, deck, cards_remaining, totals, :dealer_total)
      dealer_new_hand!(dealer_cards, totals, score)
    end
    # end of dealer turn

    break if totals[:dealer_total] > MAX_TOTAL

    # final score comparison
    display_final_comparison_prompt(totals)
    determine_winner!(totals, score)
    # end of final score comparison

  end
  # end of main game

  prompt "The score is player: #{score[:player_score]}, dealer: #{score[:dealer_score]}."
  break unless play_again?
end
# end of entire game loop

prompt "Thanks for playing, goodbye!"
