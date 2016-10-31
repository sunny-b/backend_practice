require 'pry'

module GameConstants
  OPTIONS = { '1' => :rock,
              '2' => :paper,
              '3' => :scissors,
              '4' => :lizard,
              '5' => :spock }.freeze
  WINNING_COMBOS = { rock: [:scissors, :lizard],
                     paper: [:rock, :spock],
                     scissors: [:paper, :lizard],
                     lizard: [:spock, :paper],
                     spock: [:scissors, :rock] }.freeze
  LOSING_PERCENT = 0.4
  WINNING_PERCENT = 0.6
  SEVERE_LOSE_PERCENT = 0.2
  SEVERE_WIN_PERCENT = 0.8
end

module Displayable
  def display_welcome_message
    puts "Welcome to Rock Paper Scissors! Object Oriented Edition!"
    puts "The first player to score 10 points wins!"
  end

  def display_goodbye_message
    puts "Thank you for playing! Good bye!"
  end

  def display_winner
    winner = determine_winner
    puts "#{human.name} picked #{human.choice.value}"
    puts "#{computer.name} picked #{computer.choice.value}."
    puts winner.to_s
  end

  def display_score
    puts
    puts "------------------------------"
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
    puts "------------------------------"
    puts
  end

  def display_game_over
    winner = (human.won_game? ? human.name : computer.name)
    puts "#{winner} was the first to 10 points! "\
         "#{winner} wins the game!"
  end

  def display_menu
    message = <<~MSG
    Menu:
    'H' for History
    'Q' to Quit
    Enter any other key to play again
    MSG

    display_options(message)
  end

  def display_options(message)
    loop do
      puts message
      answer = gets.chomp.downcase

      if answer == 'h'
        human.display_history
        puts
        computer.display_history
        puts
      elsif answer == 'q'
        die
      else
        clear_screen
        break
      end
    end
  end

  def display_history
    puts "Choice history for #{name}:"
    history.each do |choice, number|
      puts "#{choice}: #{number}"
    end
  end
end

class Player
  include Displayable
  attr_accessor :name, :choice, :score, :history

  def initialize
    set_name
    @score = 0
    @history = { rock: 0, paper: 0, scissors: 0, lizard: 0, spock: 0 }
  end

  def increase_score
    self.score += 1
  end

  def won_game?
    self.score >= 10
  end

  def update_history
    history[choice.value] += 1
  end

  def reset
    self.score = 0
    self.history = { rock: 0, paper: 0, scissors: 0, lizard: 0, spock: 0 }
  end
end

class Human < Player
  include GameConstants
  def set_name
    loop do
      puts "What is your name?"
      self.name = gets.chomp
      break unless name.empty?
      puts "Please enter your name."
    end
  end

  def retrieve_choice
    loop do
      message = <<~MSG
      #{name} please enter:
      1 for Rock
      2 for Paper
      3 for Scissors
      4 for Lizard
      5 for Spock
      MSG
      puts message
      choice = gets.chomp
      return OPTIONS[choice] if OPTIONS.keys.include?(choice)
      puts "Invalid choice."
    end
  end

  def choose
    chc = retrieve_choice
    self.choice = Choice.new(chc)
    update_history
  end
end

class Computer < Player
  include GameConstants
  attr_accessor :percent_option, :cumul_option

  def set_name
    self.name = self.class
  end

  def self.select
    [R2D2, Hal, NonRepeater, Repeater, Chappie, Number5].sample.new
  end

  def calculate_options
    cumulative = 0
    @cumul_option = {}

    @percent_option.each do |choice, _|
      @cumul_option[choice] = (cumulative += @percent_option[choice])
    end
  end

  def reset
    super
    calculate_options
  end

  def use_choice_algorithm
    wins = self.score.to_f
    history = self.history
    total_rounds = history.values.reduce(:+).to_f if !!history
    win_percent = wins / total_rounds
    most_used = history.values.max
    least_used = history.values.min
    most_key = history.key(most_used)
    least_key = history.key(least_used)

    augment(win_percent, most_key, least_key)
  end

  def augment(win_percent, max_key, min_key)
    if win_percent <= SEVERE_LOSE_PERCENT
      adjust_percent_losing(0.2, max_key, min_key)
    elsif win_percent <= LOSING_PERCENT
      adjust_percent_losing(0.1, max_key, min_key)
    elsif win_percent >= SEVERE_WIN_PERCENT
      adjust_percent_winning(0.2, max_key, min_key)
    elsif win_percent >= WINNING_PERCENT
      adjust_percent_winning(0.1, max_key, min_key)
    end

    calculate_options
  end

  def adjust_percent_losing(percent, max_key, min_key)
    @percent_option[max_key] -= percent unless percent_option[max_key].zero?
    @percent_option[min_key] += percent unless percent_option[min_key] == 1
  end

  def adjust_percent_winning(percent, max_key, min_key)
    @percent_option[max_key] += percent unless percent_option[max_key] == 1
    @percent_option[min_key] -= percent unless percent_option[min_key].zero?
  end

  def choose
    self.choice = Choice.new(retrieve_choice)
    update_history
  end

  def retrieve_choice
    rand_num = rand
    rand_choice = cumul_option.find do |_, percent|
      percent > rand_num
    end
    rand_choice.first
  end
end

# Uses algorithm and chooses all options
class R2D2 < Computer
  def initialize
    super
    @percent_option = { rock: 0.2,
                        paper: 0.2,
                        scissors: 0.2,
                        lizard: 0.2,
                        spock: 0.2 }
    calculate_options
  end
end

# Never picks Spock, but uses algorithm
class Hal < Computer
  def initialize
    super
    @percent_option = { rock: 0.25,
                        paper: 0.25,
                        scissors: 0.25,
                        lizard: 0.25,
                        spock: 0.0 }
    calculate_options
  end

  def retrieve_choice
    loop do
      return super unless super == :spock
    end
  end
end

# Only picks original three using algorithm, favors rock.
class Chappie < Computer
  def initialize
    super
    @percent_option = { rock: 0.75,
                        paper: 0.10,
                        scissors: 0.15,
                        lizard: 0.0,
                        spock: 0.0 }
    calculate_options
  end

  def retrieve_choice
    loop do
      return super unless super == :spock || choice == :lizard
    end
  end
end

# Only picks rock, no algorithm
class Number5 < Computer
  def choose
    self.choice = Choice.new(:rock)
    update_history
  end

  def use_choice_algorithm
    nil
  end
end

# Never repeats last pick, w/ algorithm
class NonRepeater < Computer
  def initialize
    super
    @percent_option = { rock: 0.2,
                        paper: 0.2,
                        scissors: 0.2,
                        lizard: 0.2,
                        spock: 0.2 }
    calculate_options
  end

  def retrieve_choice
    last_choice = choice
    loop do
      return super unless super == last_choice
    end
  end
end

# Repeats last choice if won, otherwise picks random. No algorithm
class Repeater < Computer
  attr_accessor :score_counter
  def initialize
    super
    @score_counter = 0
    @percent_option = { rock: 0.2,
                        paper: 0.2,
                        scissors: 0.2,
                        lizard: 0.2,
                        spock: 0.2 }
    calculate_options
  end

  def choose
    if @score_counter < self.score
      @score_counter += 1
    else
      super
    end
  end

  def reset
    super
    self.score_counter = 0
  end

  def use_choice_algorithm
    nil
  end
end

class Choice
  include GameConstants
  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def >(other_choice)
    WINNING_COMBOS[value].include?(other_choice.value)
  end

  def to_s
    value
  end
end

class RPSGame
  include Displayable
  attr_accessor :human, :computer

  def initialize
    clear_screen
    display_welcome_message
    @human = Human.new
    @computer = Computer.select
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (Y)es/(N)o"
      answer = gets.chomp.downcase
      break if ['y', 'yes', 'n', 'no'].include? answer
      puts "Sorry, that's not a valid choice"
    end
    return true if ['y', 'yes'].include? answer
    false
  end

  def die
    display_goodbye_message
    exit
  end

  def clear_screen
    system "clear"
  end

  def reset_game
    human.reset
    computer.reset
    clear_screen
  end

  def log_scores
    if human.choice > computer.choice
      human.increase_score
    elsif computer.choice > human.choice
      computer.increase_score
    end
  end

  def play_a_round
    human.choose
    computer.choose
    display_winner
    log_scores
    display_score
    computer.use_choice_algorithm
  end

  def play
    loop do
      loop do
        play_a_round
        break if human.won_game? || computer.won_game?
        display_menu
      end
      display_game_over
      break unless play_again?
      reset_game
    end
    display_goodbye_message
  end

  protected

  def determine_winner
    if human.choice > computer.choice
      "#{human.name} won!"
    elsif computer.choice > human.choice
      "#{computer.name} won!"
    else
      "It's a tie!"
    end
  end
end

RPSGame.new.play
