WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(board)
  system 'clear'
  puts "You're an #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----------------"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----------------"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def display_scores(player_score, computer_score, current_player)
  prompt "The player score is: #{player_score}, computer score: #{computer_score}"
  prompt "First to 3 wins! #{current_player.capitalize} will start the next round."
  prompt "Press any key to start the next round."
  gets
end

def display_round_winner(board)
  if someone_won?(board)
    prompt "#{detect_winner(board).capitalize} won!"
  else
    prompt "It's a tie!"
  end
end

def display_grand_winner(player_score, computer_score)
  prompt "The player score is: #{player_score}, computer score: #{computer_score}"
  if player_score == 3
    prompt "You are the grand winner, congratulations!!!"
  elsif computer_score == 3
    prompt "The computer is the grand winner, better luck next time!"
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def joinor(array, delimiter = ', ', ending = 'or')
  case array.size
  when 1 then array.first.to_s
  when 2 then array.join(" #{ending} ")
  else
    array[-1] = "#{ending} #{array.last}"
    array.join(delimiter)
  end
end

def player_places_piece!(board)
  square = ''
  loop do
    prompt "choose a square (#{joinor(empty_squares(board))}):"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt "Sorry, that is not a valid choice."
  end
  board[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def computer_square_choice(board, marker)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, board, marker)
    break if square
  end
  square
end

def computer_places_piece!(board)
  square = computer_square_choice(board, COMPUTER_MARKER)

  square = computer_square_choice(board, PLAYER_MARKER) if !square

  square = 5 if !square && board[5] == INITIAL_MARKER
  square = empty_squares(board).sample if !square
  board[square] = COMPUTER_MARKER
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    if board.values_at(*line).count(PLAYER_MARKER) == 3
      return 'player'
    elsif board.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'computer'
    end
  end
  nil
end

def computer_chooses_who_goes_first?
  does_computer_choose = ''
  loop do
    prompt 'Do you want the computer to choose who goes first? (yes, no)'
    does_computer_choose = gets.chomp.downcase[0]

    case does_computer_choose
    when 'y' then return true
    when 'n' then return false
    else prompt 'Sorry, that is not a valid response.'
    end
  end
end

def player_chooses_who_goes_first
  answer = ''
  loop do
    prompt 'Who do you want to make the first move? (player, computer)'
    answer = gets.chomp.downcase[0]
    break if answer == 'p' || answer == 'c'
    prompt 'Sorry, that is not a valid response.'
  end

  if answer == 'p'
    answer = 'player'
  elsif answer == 'c'
    answer = 'computer'
  end
end

def place_piece!(board, player)
  if player == 'player'
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def take_turn(board, player)
  display_board(board)
  place_piece!(board, player)
end

def alternate_player(player)
  player == 'player' ? 'computer' : 'player'
end

def increment_score!(board, scores)
  scores[:player_score] += 1 if detect_winner(board) == 'player'
  scores[:computer_score] += 1 if detect_winner(board) == 'computer'
end

def play_again?(hash)
  prompt "Play again? (y or n)"
  answer = gets.chomp
  if answer.downcase.start_with?('y')
    hash[:player_score] = 0
    hash[:computer_score] = 0
    true
  else
    false
  end
end

def choose_starting_player
  computer_chooses = computer_chooses_who_goes_first?
  
  if computer_chooses == true
    starting_player = ['player', 'compuer'].sample
    prompt "Computer chooses #{starting_player} to go first!"
    prompt "Press any key to continue."
    gets
    starting_player
  elsif computer_chooses == false
    player_chooses_who_goes_first
  end
end

system 'clear'
scores = { player_score: 0, computer_score: 0 }

prompt 'Welcome to tictactoe! Mark three squares in a row to win the round.'
prompt 'It is you versus the computer, first to win three rounds wins the match!'

loop do
  round_starting_tracker = choose_starting_player
  loop do
    board = initialize_board
    current_player = round_starting_tracker
    loop do
      take_turn(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)
    display_round_winner(board)
    increment_score!(board, scores)

    break if scores[:player_score] == 3 || scores[:computer_score] == 3

    round_starting_tracker = alternate_player(round_starting_tracker)
    display_scores(scores[:player_score], scores[:computer_score], round_starting_tracker)
  end

  display_grand_winner(scores[:player_score], scores[:computer_score])

  new_game = play_again?(scores)
  break if new_game == false
  system 'clear'
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
