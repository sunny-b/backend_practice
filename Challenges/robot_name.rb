class Robot
  LETTERS = ('A'..'Z').to_a.freeze
  NUMBERS = ('0'..'9').to_a.freeze

  attr_reader :name

  @@robot_names = []

  def initialize
    @name = generate_name
    @@robot_names << @name
  end

  def reset
    until !@@robot_names.include?(@name)
      @name = generate_name
    end
  end

  private

  def generate_name
    loop do
      name = ''
      5.times do |round|
        name << (round < 2 ? LETTERS.sample : NUMBERS.sample)
      end
      break name if !@@robot_names.include?(name)
    end
  end
end
