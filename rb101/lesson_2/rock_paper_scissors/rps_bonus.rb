VALID_CHOICES = %w(rock paper scissors spock lizard)

VALID_CHOICES_EXPLANATION = ['r - rock',
                             'p - paper',
                             'sc - scissors',
                             'sp - spock',
                             'l - lizard']

WIN_CONDITIONS = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  spock: ['rock', 'scissors'],
  lizard: ['paper', 'spock']
}

VALID_CHOICES_ABR = {
  r: 'rock',
  p: 'paper',
  sc: 'scissors',
  sp: 'spock',
  l: 'lizard'
}

def prompt(message)
  puts "=> #{message}"
end

def display_results(player, computer)
  if WIN_CONDITIONS[player].include?(computer)
    prompt "You won!"
  elsif WIN_CONDITIONS[computer.to_sym].include?(player.to_s)
    prompt "Computer won!"
  else
    prompt "It's a tie!"
  end
end

def abbreviation_conversion(abr)
  case abr
  when 'r' then :rock
  when 'p' then :paper
  when 'sc' then :scissors
  when 'sp' then :spock
  when 'l' then :lizard
  end
end

player_score = 0
computer_score = 0
player_wins = 0
computer_wins = 0

prompt "Welcome to Rock Paper Scisors Spock Lizard!"
prompt "A fresh take on the classic game."
prompt "It works the same as classic Rock Paper Scisors, with the addition"
prompt "of 2 new options, Spock and Lizard."
prompt "The rules are as follows:"
prompt "Rock crushes scissors and lizard."
prompt "Paper covers rock and disproves Spock."
prompt "Scisors cuts paper and decapitates lizard."
prompt "Spock smashes scissors and vaporizes rock."
prompt "Lizard poisons spock a  nd eats paper."
prompt "First to 3 wins, ready? Let's go! press any key to start!"

gets.chomp
system('clear')

puts
loop do # loop to start new game
  loop do # main game loop
    choice = ''
    loop do
      prompt "Choose one: #{VALID_CHOICES_EXPLANATION.join(', ')}"
      choice = gets.chomp.downcase

      if VALID_CHOICES_ABR.key?(choice.to_sym)
        prompt "You chose: #{abbreviation_conversion(choice)}."
        choice = abbreviation_conversion(choice)
        break
      elsif VALID_CHOICES_ABR.value?(choice.to_s)
        prompt "You chose #{choice}"
        choice = choice.to_sym
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt "The computer chose #{computer_choice}."

    display_results(choice, computer_choice)

    if WIN_CONDITIONS[choice].include?(computer_choice)
      player_score += 1
    elsif WIN_CONDITIONS[computer_choice.to_sym].include?(choice.to_s)
      computer_score += 1
    end

    score_prompt = <<-MSG
      The score is:
         Player: #{player_score}
         Computer Score: #{computer_score}
    MSG

    prompt score_prompt

    if player_score == 3
      prompt "You are the Grand Winner, congratulations!"
      player_wins += 1
      break
    elsif computer_score == 3
      prompt "The computer is the Grand Winner, better luck next time!"
      computer_wins += 1
      break
    end
  end

  puts # blank line to break up games
  prompt "The game record is Player: #{player_wins} wins. Computer: #{computer_wins} wins."
  prompt "Do you want to play again? (y to play again)"
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
  system('clear')

  player_score = 0
  computer_score = 0
end

prompt "Thanks for playing, goodbye!"

# store scores in a hash so it's a single variable
