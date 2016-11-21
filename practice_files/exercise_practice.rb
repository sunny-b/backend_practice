class PingGame
  def initialize(min, max)
    @range = (min..max).to_a
  end

  def play
    system 'clear'
    reset
    loop do
      remaining_guesses
      guess = enter_guess
      decrease_guess
      if display_result(guess) == "win"
        break
      elsif out_of_guesses?
        lose_game
        break
      end
    end
  end

  private

  def reset
    @guesses = Math.log2(@range.size).to_i + 1
    @answer = @range.sample
  end

  def decrease_guess
    @guesses -= 1
  end

  def out_of_guesses?
    @guesses == 0
  end

  def remaining_guesses
    puts "You have #{@guesses} guesses remaining."
  end

  def lose_game
    puts "You are out of guesses. You lose."
  end

  def enter_guess
    loop do
      enter_num = "Enter a number between #{@range.first} and #{@range.last}: "
      print enter_num
      guess = gets.chomp.to_i
      return guess if @range.include?(guess)
      print "Invalid guess. "
    end
  end

  def display_result(guess)
    if guess > @answer
      puts "Your guess is too high"
      puts
    elsif guess < @answer
      puts "Your guess is too low"
      puts
    else
      puts "You win!"
      'win'
    end
  end
end

game = PingGame.new(501, 1500)
game.play
