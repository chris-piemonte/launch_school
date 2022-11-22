VALID_CHOICES = %w(rock paper scissors spock lizard)

VALID_CHOICES_ABR = ['r - rock', 'p - paper', 'sc - scissors', 'sp - spock', 'l - lizard']

WIN_CONDITIONS = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  spock: ['rock', 'scissors'],
  lizard: ['paper', 'spock']
}

WIN_CONDITIONS_ABR = {
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

player_score = 0
computer_score = 0

prompt "Welcome to Rock Paper Scisors Spock Lizard! A fresh take on the classic game."
prompt "It works the same as classic Rock Paper Scisors, with the addition of 2 new options, Spock and Lizard."
prompt "The rules are as follows:"
prompt "Rock crushes scissors and lizard."
prompt "Paper covers rock and disproves Spock."
prompt "Scisors cuts paper and decapitates lizard."
prompt "Spock smashes scissors and vaporizes rock."
prompt "Lizard poisons spock and eats paper."
prompt "First to 3 wins, ready? Let's go!"

puts
loop do # loop to start new game
  loop do # main game loop
    choice = ''
    loop do
      prompt "Choose one: #{VALID_CHOICES_ABR.join(', ')}"
      choice = gets.chomp.downcase

      if WIN_CONDITIONS_ABR.key?(choice.to_sym)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    choice_conversion = case choice
                        when 'r' then :rock
                        when 'p' then :paper
                        when 'sc' then :scissors
                        when 'sp' then :spock
                        when 'l' then :lizard
                        end

    computer_choice = VALID_CHOICES.sample

    prompt "You chose: #{choice_conversion}"
    prompt "The computer chose #{computer_choice}."

    display_results(choice_conversion, computer_choice)

    if WIN_CONDITIONS[choice_conversion].include?(computer_choice)
      player_score += 1
    elsif WIN_CONDITIONS[computer_choice.to_sym].include?(choice_conversion.to_s)
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
      break
    elsif computer_score == 3
      prompt "The computer is the Grand Winner, better luck next time!"
      break
    end
  end

  puts # blank line to break up games
  prompt "Do you want to play again? (y to play again)" #
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'

  player_score = 0
  computer_score = 0
end

prompt "Thanks for playing, goodbye!"
