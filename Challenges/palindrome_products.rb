class Palindromes
  attr_reader :max_factor, :min_factor, :palindromes

  def initialize(max_factor: maxfactor, min_factor: minfactor = 1)
    @max_factor = max_factor
    @min_factor = min_factor
    @palindromes = []
    @values = []
  end

  def generate
    (min_factor..max_factor).each do |num1|
      (min_factor..max_factor).each do |num2|
        product = num1 * num2
        next if !palindrome?(product)
        palindrome = @palindromes.select { |palin| palin.value == product }

        if palindrome.empty?
          @palindromes << Palindrome.new(product)
          @palindromes.last << [num1, num2].sort
          @values << product
        else
          palindrome.first << [num1, num2].sort
        end
      end
    end
  end

  def smallest
    @palindromes.first
    # @palindromes.find { |palin| palin.value == @values.min }
  end

  def largest
    @palindromes.find { |palin| palin.value == @values.max }
  end

  private

  def palindrome?(number)
    number.to_s.reverse.to_i == number
  end
end

class Palindrome
  attr_accessor :value

  def initialize(number)
    @value = number
    @factors = []
  end

  def <<(array)
    @factors << array
  end

  def factors
    @factors.uniq
  end
end
