=begin
given a string that is a math problem. Turn that string into a math solution.

method:

-split the string up and get rid of first two words.
-map through and find numbers, will serve as my error test.
-create methods and use send to create them.

=end

class WordProblem
  attr_reader :problem

  def initialize(string)
    @problem = convert(string)
  end

  def answer
    raise ArgumentError if invalid?

    sum = @problem.shift
    @problem.each_slice(2) do |op, num|
      sum = send(op, sum, num)
    end
    sum
  end

  private

  def convert(string)
    string.slice! "What is"
    string = string.chomp('?').strip
    string = string.gsub(/by/, '')

    string.split.map do |element|
      element.to_i.to_s == element ? element.to_i : element
    end
  end

  def plus(sum, number)
    sum + number
  end

  def minus(sum, number)
    sum - number
  end

  def multiplied(sum, number)
    sum * number
  end

  def divided(sum, number)
    sum / number
  end

  def invalid?
    @problem.size < 3 || (@problem.count { |num| num % 1 == 0 } < 2)
  end
end

WordProblem.new('What is 1 plus 1?').problem
