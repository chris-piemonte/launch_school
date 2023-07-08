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
def display_board(brd)
  system 'clear'
  puts "You're an #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----------------"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----------------"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
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

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that is not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def computer_square_choice(brd, marker)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, marker)
    break if square
  end
  square
end

def computer_places_piece!(brd)
  square = computer_square_choice(brd, COMPUTER_MARKER)

  square = computer_square_choice(brd, PLAYER_MARKER) if !square

  square = 5 if !square && brd[5] == INITIAL_MARKER
  square = empty_squares(brd).sample if !square
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def computer_chooses_who_goes_first?
  does_computer_choosse = ''
  loop do
    prompt 'Do you want the computer to choose who goes first? (yes, no)'
    does_computer_choosse = gets.chomp.downcase

    case does_computer_choosse
    when 'yes' then return true
    when 'no' then return false
    else prompt 'Sorry, that is not a valid response.'
    end
  end
end

def player_chooses_who_goes_first
  answer = ''
  loop do
    prompt 'Who do you want to make the first move? (player, computer)'
    answer = gets.chomp
    break if answer.downcase == 'player' || answer.downcase == 'computer'
    prompt 'Sorry, that is not a valid response.'
  end
  answer
end

def place_piece!(brd, player)
  if player == 'player'
    player_places_piece!(brd)
  elsif player == 'computer'
    computer_places_piece!(brd)
  end
end

def alternate_player!(player)
  if player == 'player'
    player = 'computer'
  elsif player == 'computer'
    player = 'player'
  end
  player
end

player_score = 0
computer_score = 0

prompt 'Welcome to tictactoe! Mark three squares in a row to win the round.'

loop do
  loop do
    board = initialize_board
    computer_chooses = computer_chooses_who_goes_first?

    if computer_chooses == true
      first_move = ['player', 'computer'].sample
      prompt "Computer chooses #{first_move} to go first!"
      prompt "Press any key to continue."
      gets
    elsif computer_chooses == false
      first_move = player_chooses_who_goes_first
    end

    current_player = first_move
    if first_move == 'player'
      loop do
        display_board(board)
        place_piece!(board, current_player)
        current_player = alternate_player!(current_player)
        break if someone_won?(board) || board_full?(board)
      end
    elsif first_move == 'computer'
      loop do
        display_board(board)
        place_piece!(board, current_player)
        current_player = alternate_player!(current_player)
        break if someone_won?(board) || board_full?(board)
      end
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      player_score += 1 if detect_winner(board) == 'Player'
      computer_score += 1 if detect_winner(board) == 'Computer'
    else
      prompt "It's a tie!"
    end

    break if player_score == 3 || computer_score == 3
    prompt "The score is player: #{player_score}, computer: #{computer_score}"
    prompt "First to 3 wins."
    prompt "Press any key to start the next round."
    gets
  end

  if player_score == 3
    prompt "You are the grand winner, congratulations!!!"
  elsif computer_score == 3
    prompt "The computer is the grand winner, better luck next time!"
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  if answer.downcase.start_with?('y')
    player_score = 0
    computer_score = 0
  else
    break
  end
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
