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

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
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
      square = find_best_square(line, TTTGame.human_marker)
      return @squares.key(square) if square
    end
    nil
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

  def two_identical_markers?(winning_line, player)
    markers = winning_line.select { |line| line.player_marked?(player) }

    markers.map(&:marker)
    return false if markers.size != 2
    true
  end

  def find_best_square(line, marker)
    if line.count { |square| square.marker == marker } == 2 &&
       line.count { |square| square.marker == Square::INITIAL_MARKER } == 1
      line.select { |square| square.marker == Square::INITIAL_MARKER }.first
    end
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
    when 'computer' then marker == TTTGame::COMPUTER_MARKER
    end
  end
end

class Player
  attr_accessor :name, :marker, :score

  def initialize(name, marker)
    @name = name
    @marker = marker
    @score = 0
  end
end

class TTTGame
  COMPUTER_MARKER = 'O'
  @@human_marker = nil

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(nil, nil)
    @computer = Player.new(choose_computer_name, COMPUTER_MARKER)
    @current_marker = nil
    @round_starter = nil
  end

  def self.human_marker
    @@human_marker
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

  def choose_computer_name
    %w(Gonko Beeboop MrRoboto Cortana).sample
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
  end

  def game_setup
    if @round_starter.nil?
      game_setup_choices
    else
      play_again_setup
    end
  end

  def game_setup_choices
    choose_human_name
    display_player_names
    choose_marker
    choose_player_order
    @round_starter = @current_marker
  end

  def play_again_setup
    change_round_starter
    @current_marker = @round_starter
    puts "This time #{display_player} will go first!"
    puts "Press enter to continue."
    gets
  end

  def display_player
    case @round_starter
    when human.marker then human.name
    when COMPUTER_MARKER then computer.name
    end
  end

  def choose_human_name
    name = nil
    loop do
      puts "What is your name?"
      name = gets.chomp.strip
      break unless name.empty?
      puts "Sorry, you must enter at least one character."
    end
    human.name = name
  end

  def display_player_names
    puts "Lovely to meet you #{human.name}!"
    puts "Your opponent is #{computer.name}"
    puts "press enter to continue."
    gets
    clear_screen_and_display_board
  end

  def choose_marker
    answer = nil
    loop do
      display_marker_prompt
      answer = gets.chomp.strip
      break unless answer.size != 1 || ['o', 'O'].include?(answer)
      display_marker_errors(answer)
    end
    @human.marker = answer
    @@human_marker = answer
  end

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

  def choose_player_order
    decision = choose_who_chooses_to_go_first
    if decision == 'y'
      human_choose_who_goes_first
    elsif decision == 'n'
      computer_choose_who_goes_first
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

  def first_move_decision
    decision = ''
    loop do
      puts "Who do you want to go first, yourself (h) or #{computer.name} (c)?"
      decision = gets.chomp.downcase
      break if %w(h c).include?(decision)
      puts "Sorry that is an invalid answer, must be human(h) or computer(c)."
    end
    decision
  end

  def human_choose_who_goes_first
    decision = first_move_decision
    @current_marker = case decision
                      when 'h' then human.marker
                      when 'c' then COMPUTER_MARKER
                      end
    clear_screen_and_display_board
  end

  def computer_choose_who_goes_first
    choice = [human.name, computer.name].sample
    puts "#{computer.name} chooses #{choice} to go first!"
    puts "press enter to continue."
    gets
    clear_screen_and_display_board

    @current_marker = case choice
                      when human.name then human.marker
                      when computer.name then COMPUTER_MARKER
                      end
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    if !human.marker.nil?
      puts "You're #{human.marker}. #{computer.name} is #{computer.marker}."
    end
    board.draw
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
    @current_marker == human.marker
  end

  def computer_turn?
    @current_marker == COMPUTER_MARKER
  end

  def change_whose_turn
    if @current_marker == human.marker
      @current_marker = COMPUTER_MARKER
    elsif @current_marker == COMPUTER_MARKER
      @current_marker = human.marker
    end
  end

  def change_round_starter
    if @round_starter == human.marker
      @round_starter = COMPUTER_MARKER
    elsif @round_starter == COMPUTER_MARKER
      @round_starter = human.marker
    end
  end

  def current_player_moves
    human_moves if @current_marker == human.marker
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
    human_info = "#{human.name}: #{human.score}"
    computer_info = "#{computer.name}: #{computer.score}"
    puts "The score is #{human_info}, #{computer_info}"
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
    clear_screen
  end
end

# to start the game
game = TTTGame.new
game.play
