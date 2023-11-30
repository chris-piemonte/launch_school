module DisplayMessages
  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
    puts "First to 3 wins is the victor!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_round_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif computer.move > human.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_score
    puts "The score is human: #{human.score}, computer: #{computer.score}."
  end

  def display_game_winner
    if human.score == RPSGame::WINNING_SCORE
      puts "#{human.name} wins! Congratulations!"
    elsif computer.score == RPSGame::WINNING_SCORE
      puts "#{computer.name} wins! Better luck next time."
    end
  end

  def display_last_round_moves
    round = 1
    human.move_history.size.times do |ele|
      human_choice = "#{human.name} chose #{human.move_history[ele]}"
      comp_choice = "computer chose #{computer.move_history[ele]}"
      winner = "#{winner_history[ele]}"
      puts "On round #{round} #{human_choice}, #{comp_choice}. #{winner}!"
      round += 1
    end
  end

  def display_move_history?
    answer = nil
    loop do
      puts "Would you like to see the rounds of the last game? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end
    display_last_round_moves if answer == 'y'
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']
  attr_reader :value
  attr_writer :move

  def initialize(value)
    @value = value
    @move = ''
  end

  def >(other_move)
    self.class::WINS_AGAINST.include?(other_move.to_s)
  end

  def to_s
    @value
  end
end

class Rock < Move
  WINS_AGAINST = ['scissors', 'lizard']
end

class Paper < Move
  WINS_AGAINST = ['rock', 'spock']
end

class Scissors < Move
  WINS_AGAINST = ['paper', 'lizard']
end

class Spock < Move
  WINS_AGAINST = ['rock', 'scissors']
end

class Lizard < Move
  WINS_AGAINST = ['paper', 'spock']
end

class Player
  attr_accessor :move, :name, :score, :move_history

  def initialize
    set_name
    self.score = 0
    self.move_history = []
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def prompt_choice
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, spock, or lizard:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    choice
  end

  def choose
    choice = prompt_choice
    self.move = Rock.new(choice) if choice == 'rock'
    self.move = Paper.new(choice) if choice == 'paper'
    self.move = Scissors.new(choice) if choice == 'scissors'
    self.move = Spock.new(choice) if choice == 'spock'
    self.move = Lizard.new(choice) if choice == 'lizard'
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choices
    choices = []
    self.class::MOVE_CHANCES.each do |move, prob|
      prob.times { choices << move }
    end
    choices
  end

  def choose
    choice = choices.sample
    self.move = Rock.new(choice) if choice == 'rock'
    self.move = Paper.new(choice) if choice == 'paper'
    self.move = Scissors.new(choice) if choice == 'scissors'
    self.move = Spock.new(choice) if choice == 'spock'
    self.move = Lizard.new(choice) if choice == 'lizard'
  end
end

class R2D2 < Computer
  def set_name
    self.name = 'R2D2'
  end

  MOVE_CHANCES = {
    'rock' => 2,
    'paper' => 2,
    'scissors' => 2,
    'spock' => 2,
    'lizard' => 2
  }
end

class Hal < Computer
  def set_name
    self.name = 'Hal'
  end

  MOVE_CHANCES = {
    'rock' => 3,
    'paper' => 1,
    'scissors' => 3,
    'spock' => 1,
    'lizard' => 2
  }
end

class Chappie < Computer
  def set_name
    self.name = 'Chappie'
  end

  MOVE_CHANCES = {
    'rock' => 4,
    'paper' => 3,
    'scissors' => 3,
    'spock' => 0,
    'lizard' => 0
  }
end

class Sonny < Computer
  def set_name
    self.name = 'Sonny'
  end

  MOVE_CHANCES = {
    'rock' => 6,
    'paper' => 1,
    'scissors' => 4,
    'spock' => 1,
    'lizard' => 1
  }
end

class Number5 < Computer
  def set_name
    self.name = 'Number 5'
  end

  MOVE_CHANCES = {
    'rock' => 10,
    'paper' => 0,
    'scissors' => 0,
    'spock' => 0,
    'lizard' => 0
  }
end

class RPSGame
  WINNING_SCORE = 3
  include DisplayMessages
  attr_accessor :human, :computer, :winner_history

  def initialize
    @human = Human.new
    @computer = [R2D2.new, Hal.new, Chappie.new, Sonny.new, Number5.new].sample
    @winner_history = []
  end

  def increment_score
    if human.move > computer.move
      human.score += 1
    elsif computer.move > human.move
      computer.score += 1
    end
  end

  # Why does this give "C: [Correctable] Style/ConditionalAssignment: Use the
  # return of the conditional for variable assignment and comparison."
  def record_winner
    if human.move > computer.move
      winner_history << 'Human won'
    elsif computer.move > human.move
      winner_history << 'Computer won'
    else
      winner_history << "It was a tie"
    end
  end

  def record_moves
    human.move_history << human.move
    computer.move_history << computer.move
  end

  def record_history
    record_winner
    record_moves
  end

  def winner?
    human.score == WINNING_SCORE || computer.score == WINNING_SCORE
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    false if answer == 'n'
    true if answer == 'y'
  end

  def reset_score_and_move_history
    human.score = 0
    computer.score = 0
    human.move_history = []
    computer.move_history = []
  end

  def game_loop
    loop do
      human.choose
      computer.choose
      display_moves
      display_round_winner
      increment_score
      record_history
      display_score
      break if winner?
    end
  end

  def play
    display_welcome_message
    loop do
      game_loop
      display_game_winner
      display_move_history?
      break unless play_again?
      reset_score_and_move_history
    end
    display_goodbye_message
  end
end

RPSGame.new.play
