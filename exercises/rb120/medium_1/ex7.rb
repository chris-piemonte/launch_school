class GuessingGame
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
  attr_reader :num, :range

  def initialize(min, max)
    @range = min...max
    @num = rand(range)
    @guesses = Math.log2(range.last - range.first).to_i + 1
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
      print "Enter a number between #{range.first} and #{range.last}: "
      guess = gets.chomp.to_i
      return guess if range.include?(guess)
      print "Invalid guess."
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

game = GuessingGame.new(501, 1500)

game.play
