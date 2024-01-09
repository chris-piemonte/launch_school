require 'pry'

=begin

Tic Tac Toe is a 2-player board game played on a 3x3 grid. Players take turns
marking a square. THe first player to mark 3 in a row wins.

Nouns: board, player, square, grid
Verbs: play, mark

Board
Square
Player
- mark
- play

=end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def [](num)
    @squares[num]
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def find_best_square(line, marker)
    if line.count { |square| square.marker == marker } == 2 &&
       line.count { |square| square.marker == Square::INITIAL_MARKER } == 1
      line.select { |square| square.marker == Square::INITIAL_MARKER }.first
    end
  end

  def find_offensive_square
    array_of_winning_lines.each do |line|
      square = find_best_square(line, TTTGame::COMPUTER_MARKER)
      return @squares.key(square) if square
    end
    nil
  end

  def find_defensive_square
    array_of_winning_lines.each do |line|
      square = find_best_square(line, TTTGame::HUMAN_MARKER)
      return @squares.key(square) if square
    end
    nil
  end

  def offensive_square_needed?
    array_of_winning_lines.each do |line|
      if two_identical_computer_markers?(line) &&
         line.any? { |square| square.marker == Square::INITIAL_MARKER }
        return true
      end
    end
    false
  end

  def defensive_square_needed?
    array_of_winning_lines.each do |line|
      if two_identical_human_markers?(line) &&
         line.any? { |square| square.marker == Square::INITIAL_MARKER }
        return true
      end
    end
    false
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts ""
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
    puts ""
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def array_of_winning_lines
    array = []
    WINNING_LINES.each do |line|
      array << @squares.values_at(*line)
    end
    array
  end

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).map(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end

  def two_identical_human_markers?(winning_line)
    markers = winning_line.select(&:human_marked?).map(&:marker)
    return false if markers.size != 2
    true
  end

  def two_identical_computer_markers?(winning_line)
    markers = winning_line.select(&:computer_marked?).map(&:marker)
    return false if markers.size != 2
    true
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def human_marked?
    marker == TTTGame::HUMAN_MARKER
  end

  def computer_marked?
    marker == TTTGame::COMPUTER_MARKER
  end
end

class Player
  attr_accessor :score
  attr_reader :marker

  def initialize(marker)
    @marker = marker
    @score = 0
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = nil
  end

  def play
    clear_screen
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      display_board
      player_order
      players_turns
      increment_score
      display_result
      break unless play_again?
      reset_game
      display_reset_game_message
    end
  end

  def clear_screen
    system 'clear'
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def player_order
    decider = choose_who_chooses_to_go_first
    if decider == 'h'
      human_choose_who_goes_first
    elsif decider == 'c'
      computer_choose_who_goes_first
    end
  end

  def choose_who_chooses_to_go_first
    answer = ''

    loop do
      puts "Who should choose who goes first, human(h) or computer(c)?"
      answer = gets.chomp.downcase
      break if %w(h c).include?(answer)
      puts "Sorry that is an invalid answer, must be human(h) or computer(c)."
    end

    answer
  end

  def first_move_decision
    decision = ''

    loop do
      puts "Who do you want to go first, human(h) or computer(c)?"
      decision = gets.chomp.downcase
      break if %w(h c).include?(decision)
      puts "Sorry that is an invalid answer, must be human(h) or computer(c)."
    end

    decision
  end

  def human_choose_who_goes_first
    decision = first_move_decision

    @current_marker = case decision
                      when 'h' then HUMAN_MARKER
                      when 'c' then COMPUTER_MARKER
                      end
  end

  def computer_choose_who_goes_first
    choice = %w(human computer).sample
    puts "The computer chooses #{choice} to go first!"
    puts "press any key to continue"
    gets

    @current_marker = case choice
                      when 'human' then HUMAN_MARKER
                      when 'computer' then COMPUTER_MARKER
                      end
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    puts "You're a #{human.marker}. The computer is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def display_square_choices
    unmarked_keys = board.unmarked_keys
    case board.unmarked_keys.size
    when 1 then puts "Choose a square (#{unmarked_keys.first}):"
    when 2 then puts "Choose a square (#{unmarked_keys.join(' or ')}):"
    else print "Choose a square "
         puts "(#{unmarked_keys[0..-2].join(', ')}, or #{unmarked_keys.last}):"
    end
  end

  def human_moves
    display_square_choices
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    board[square] = human.marker
  end

  # rubocop:disable Metrics/AbcSize
  def computer_moves
    square = if board.offensive_square_needed?
               board.find_offensive_square
             elsif board.defensive_square_needed?
               board.find_defensive_square
             elsif board[5].unmarked?
               5
             else
               board.unmarked_keys.sample
             end

    board[square] = computer.marker
  end
  # rubocop:enable Metrics/AbcSize

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def computer_turn?
    @current_marker == COMPUTER_MARKER
  end

  def change_whose_turn
    if @current_marker == HUMAN_MARKER
      @current_marker = COMPUTER_MARKER
    elsif @current_marker == COMPUTER_MARKER
      @current_marker = HUMAN_MARKER
    end
  end

  def current_player_moves
    human_moves if @current_marker == HUMAN_MARKER
    computer_moves if @current_marker == COMPUTER_MARKER
    change_whose_turn
  end

  def players_turns
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def increment_score
    human.score += 1 if board.winning_marker == human.marker
    computer.score += 1 if board.winning_marker == computer.marker
  end

  def display_score
    puts "The score is human: #{human.score}, computer: #{computer.score}"
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else
      puts "It's a tie!"
    end

    display_score
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def display_reset_game_message
    puts "Let's play again!"
    puts ''
  end

  def reset_game
    board.reset
    @current_marker = nil
    clear_screen
  end
end

# to start the game
game = TTTGame.new
game.play
