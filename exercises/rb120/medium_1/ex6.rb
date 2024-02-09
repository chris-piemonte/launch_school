# class GuessingGame
#   RANGE = 1..100

#   attr_accessor :guesses
#   attr_reader :num

#   def initialize
#     @guesses = 7
#     @num = rand(RANGE)
#   end

#   def play
#     main_game
#     display_lose_prompt
#   end

#   private

#   def main_game
#     loop do
#       display_round_prompt
#       guess = player_guess
#       display_result(guess)
#       return if win?(guess)
#       reduce_guesses
#       break if lost?
#     end
#   end

#   def player_guess
#     guess = nil
#     loop do
#       guess = gets.chomp.to_i
#       break if RANGE.include?(guess)
#       display_invalid_guess
#     end
#     guess
#   end

#   def display_round_prompt
#     puts "you have #{guesses} geusses remaining."
#     print "Enter a number between 1 and #{RANGE.last}: "
#   end

#   def display_invalid_guess
#     print "Invalid guess. Enter a nuber between 1 and #{RANGE.last}: "
#   end

#   def display_result(guess)
#     if win?(guess)
#       puts "That's the number!" 
#       puts
#       puts "You won!"
#     end
#     puts "Your guess  is too low." if guess < num
#     puts "Your guess is too high." if guess > num
#     puts
#   end

#   def reduce_guesses
#     @guesses -= 1
#   end

#   def win?(guess)
#     guess == num
#   end

#   def lost?
#     guesses == 0
#   end

#   def display_lose_prompt
#     puts "You have no more guesses. You lost!"
#   end
# end

#---------------------------------------------------------

class GuessingGame
  RANGE = 1..100

  RESULT_OF_GUESS = {
    low: "Your guess is too low.",
    high: "Your guess is too high.",
    match: "That's the number!"
  }

  WIN_OR_LOSE = {
    low: :lose,
    high: :lose,
    match: :win
  }

  RESULT_OF_GAME = {
    win: "You won!",
    lose: "You have nomore guesses. You lost!"
  }

  attr_accessor :guesses
  attr_reader :num

  def initialize
    @guesses = 7
    @num = rand(RANGE)
  end

  def play
    game_result = main_game
    display_end_of_game_message(game_result)
  end

  private

  def main_game
    result = nil
    guesses.downto(1) do |remaining_guesses|
      display_guesses_remaining(remaining_guesses)
      result = check_guess(obtain_one_guess)
      puts RESULT_OF_GUESS[result]
      puts
      break if result == :match
    end
    WIN_OR_LOSE[result]
  end

  def display_guesses_remaining(remaining)
    if remaining == 1
      puts "You have 1 guess remaining"
    else
      puts "You have #{remaining} guesses remaining."
    end
  end

  def obtain_one_guess
    loop do
      print "Enter a number between 1 and #{RANGE.last}: "
      guess = gets.chomp.to_i
      return guess if RANGE.include?(guess)
      print "Invalid guess. Enter a number between 1 and #{RANGE.last}: "
    end
  end

  def check_guess(value)
    return :low if value < num
    return :high if value > num
    :match
  end

  def display_end_of_game_message(result)
    puts RESULT_OF_GAME[result]
  end
end

game = GuessingGame.new

game.play
