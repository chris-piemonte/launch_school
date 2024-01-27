module Display
  # rubocop:disable Metrics/LineLength
  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts "First player to win #{TTTGame::WINNING_ROUNDS} rounds first is champion!"
    puts "(you can also end the game after any round)"
  end
  # rubocop:enable Metrics/LineLength

  def display_marker_prompt
    puts "What would you like your marker to be?"
    puts "Choose any single character other than 'O':"
  end

  def display_marker_errors(answer)
    if answer.size != 1
      puts "Sorry, marker must be one character."
    elsif ['o', 'O'].include?(answer)
      puts "Sorry, #{computer.name} already claimed 'O' as their marker!"
    end
  end

  def display_reset_game_message
    puts "Let's play again!"
    puts ''
  end

  def display_player_names
    puts "Lovely to meet you #{human.name}!"
    puts "Your opponent is #{computer.name}"
    puts "press enter to continue."
    gets
    clear_screen_and_display_board
  end

  def display_player
    case @round_starter
    when human.marker then human.name
    when Computer::COMPUTER_MARKER then computer.name
    end
  end

  # rubocop:disable Metrics/LineLength
  def display_goodbye_message
    win_text = "won #{TTTGame::WINNING_ROUNDS} rounds first! They are the champion!"
    if winning_rounds_reached?
      puts "#{human.name} #{win_text}" if score[:human] == TTTGame::WINNING_ROUNDS
      puts "#{computer.name} #{win_text}" if score[:computer] == TTTGame::WINNING_ROUNDS
    end
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end
  # rubocop:enable Metrics/LineLength

  def display_board # how does this work in the display class?
    if !human.marker.nil?
      puts "You're #{human.marker}. #{computer.name} is #{computer.marker}."
    end
    board.draw_board
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def clear_screen
    system 'clear'
  end

  def display_square_choices(board)
    unmarked_keys = board.unmarked_keys
    case board.unmarked_keys.size
    when 1 then puts "Choose a square (#{unmarked_keys.first}):"
    when 2 then puts "Choose a square (#{unmarked_keys.join(' or ')}):"
    else print "Choose a square "
         puts "(#{unmarked_keys[0..-2].join(', ')}, or #{unmarked_keys.last}):"
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end

    display_score
  end

  # rubocop:disable Metrics/LineLength
  def display_score
    puts "The score is #{human.name}: #{score[:human]}, #{computer.name} #{score[:computer]}"
  end
  # rubocop:enable Metrics/LineLength
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  attr_accessor :squares

  def initialize
    @squares = {}
    reset
  end

  def reset
    (1..9).each { |key| squares[key] = Square.new }
  end

  def [](num)
    squares[num]
  end

  def []=(num, marker)
    squares[num].marker = marker
  end

  def unmarked_keys
    squares.keys.select { |key| squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares_array = squares.values_at(*line)
      if three_identical_markers?(squares_array)
        return squares_array.first.marker
      end
    end
    nil
  end

  def array_of_winning_lines
    array = []
    WINNING_LINES.each do |line|
      array << squares.values_at(*line)
    end
    array
  end

  def offensive_square_needed?
    array_of_winning_lines.each do |line|
      if two_identical_markers?(line, 'computer') &&
         line.any? { |square| square.marker == Square::INITIAL_MARKER }
        return true
      end
    end
    false
  end

  def defensive_square_needed?
    array_of_winning_lines.each do |line|
      if two_identical_markers?(line, 'human') &&
         line.any? { |square| square.marker == Square::INITIAL_MARKER }
        return true
      end
    end
    false
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw_board
    puts ""
    puts "     |     |"
    puts "  #{squares[1]}  |  #{squares[2]}  |  #{squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{squares[4]}  |  #{squares[5]}  |  #{squares[6]}"
    puts "     |     |       1 | 2 | 3 "
    puts "-----+-----+----- ---+---+---"
    puts "     |     |       4 | 5 | 6 "
    puts "  #{squares[7]}  |  #{squares[8]}  |  #{squares[9]}   ---+---+---"
    puts "     |     |       7 | 8 | 9 "
    puts ""
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).map(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end

  def two_identical_markers?(winning_line, player)
    markers = winning_line.select { |line| line.player_marked?(player) }
    markers.map(&:marker)
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

  def player_marked?(player)
    case player
    when 'human' then marker == TTTGame.human_marker
    when 'computer' then marker == Computer::COMPUTER_MARKER
    end
  end
end

class Player # Create Human and Computer Classes
  include Display

  attr_accessor :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

class Human < Player
  def choose_name
    chosen_name = nil
    loop do
      puts "What is your name?"
      chosen_name = gets.chomp.strip
      break unless chosen_name.empty?
      puts "Sorry, you must enter at least one character."
    end
    @name = chosen_name
  end

  def choose_marker
    answer = nil
    loop do
      display_marker_prompt
      answer = gets.chomp.strip
      break unless answer.size != 1 || ['o', 'O'].include?(answer)
      display_marker_errors(answer)
    end
    @marker = answer
  end

  def choose_player_order(opponent)
    decision = choose_who_chooses_to_go_first
    if decision == 'y'
      choose_who_goes_first(opponent)
    elsif decision == 'n'
      opponent.choose_who_goes_first(opponent)
    end
  end

  def choose_who_chooses_to_go_first
    answer = ''
    loop do
      puts "Would you like to choose who goes first? (y/n):"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry that is an invalid answer, must choose yes (y) or no (n)."
    end
    answer
  end

  def choose_who_goes_first(opponent)
    case first_move_decision(opponent)
    when 'h' then marker
    when 'c' then Computer::COMPUTER_MARKER
    end
  end

  def first_move_decision(opponent)
    decision = ''
    loop do
      puts "Who do you want to go first, yourself (h) or #{opponent.name} (c)?"
      decision = gets.chomp.downcase
      break if %w(h c).include?(decision)
      puts "Sorry that is an invalid answer, must be human(h) or computer(c)."
    end
    decision
  end

  def turn(board)
    display_square_choices(board)
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    board[square] = marker
  end
end

class Computer < Player
  COMPUTER_MARKER = 'O'

  def choose_name
    @name = %w(Gonko Beeboop MrRoboto Cortana).sample
  end

  def choose_who_goes_first(opponent)
    choice = [opponent.name, name].sample
    puts "#{opponent.name} chooses #{choice} to go first!"
    puts "press enter to continue."
    gets

    @current_marker = case choice
                      when name then marker
                      when opponent.name then COMPUTER_MARKER
                      end
  end

  def turn(board, human)
    square = find_offensive_square(board)
    square ||= find_defensive_square(board, human)
    square ||= 5 if board[5].unmarked?
    square ||= board.unmarked_keys.sample

    board[square] = marker
  end

  def find_offensive_square(board)
    board.array_of_winning_lines.each do |line|
      square = find_best_square(line, COMPUTER_MARKER)
      return board.squares.key(square) if square
    end
    nil
  end

  def find_defensive_square(board, human)
    board.array_of_winning_lines.each do |line|
      square = find_best_square(line, human.marker)
      return board.squares.key(square) if square
    end
    nil
  end

  def find_best_square(line, marker)
    if line.count { |square| square.marker == marker } == 2 &&
       line.count { |square| square.marker == Square::INITIAL_MARKER } == 1
      line.select { |square| square.marker == Square::INITIAL_MARKER }.first
    end
  end
end

class TTTGame
  include Display

  WINNING_ROUNDS = 3

  attr_accessor :current_marker
  attr_reader :board, :human, :computer, :score

  def initialize
    @board = Board.new
    @human = Human.new(nil, nil)
    @computer = Computer.new(nil, Computer::COMPUTER_MARKER)
    @current_marker = nil
    @round_starter = nil
    @score = { human: 0, computer: 0 }
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
      game_setup
      players_turns(human, computer)
      increment_score
      display_result
      return if winning_rounds_reached?
      break unless play_again?
      reset_game
    end
  end

  def winning_rounds_reached?
    score.values.include?(WINNING_ROUNDS)
  end

  def clear_screen
    system 'clear'
  end

  def game_setup
    if @round_starter.nil?
      game_setup_choices
      clear_screen_and_display_board
    else
      play_again_setup
    end
  end

  def game_setup_choices
    choose_names
    display_player_names
    human.choose_marker
    @current_marker = human.choose_player_order(computer)
    @round_starter = @current_marker
  end

  def choose_names
    human.choose_name
    computer.choose_name
  end

  def play_again_setup
    change_round_starter
    @current_marker = @round_starter
    puts "This time #{display_player} will go first!"
    puts "Press enter to continue."
    gets
  end

  def human_turn?
    @current_marker == human.marker
  end

  def computer_turn?
    @current_marker == Computer::COMPUTER_MARKER
  end

  def change_whose_turn
    if @current_marker == human.marker
      @current_marker = Computer::COMPUTER_MARKER
    elsif @current_marker == Computer::COMPUTER_MARKER
      @current_marker = human.marker
    end
  end

  def change_round_starter
    if @round_starter == human.marker
      @round_starter = Computer::COMPUTER_MARKER
    elsif @round_starter == Computer::COMPUTER_MARKER
      @round_starter = human.marker
    end
  end

  def players_turns(human, computer)
    loop do
      current_player_moves(human, computer)
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def current_player_moves(human, computer)
    human.turn(board) if @current_marker == human.marker
    computer.turn(board, human) if @current_marker == Computer::COMPUTER_MARKER
    change_whose_turn
  end

  def increment_score
    score[:human] += 1 if board.winning_marker == human.marker
    score[:computer] += 1 if board.winning_marker == Computer::COMPUTER_MARKER
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

  def reset_game
    board.reset
    clear_screen
    display_reset_game_message
  end
end

# to start the game
game = TTTGame.new
game.play
