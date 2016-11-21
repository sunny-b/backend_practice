class SumOfMultiples
  attr_reader :multiples

  def initialize(*nums)
    @multiples = [*nums]
  end

  def self.to(number, multiples = [3, 5])
    range = (1...number).to_a
    range.select do |num|
      multiples.any? do |factor|
        num % factor == 0
      end
    end.reduce(0, :+)
  end

  def to(number)
    self.class.to(number, @multiples)
  end
end
