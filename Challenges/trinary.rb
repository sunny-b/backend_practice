class Trinary
  BASE = 3

  def initialize(tri_num)
    @tri_num = verify(tri_num)
  end

  def to_decimal
    @tri_num == 0 ? 0 : calculate(@tri_num)
  end

  def calculate(trinary)
    sum = 0
    @tri_num
      .chars
      .map(&:to_i)
      .reverse
      .each_with_index { |num, expo| sum += num * (BASE**expo) }
    sum
  end

  private

  def verify(num)
    num.match(/[^0-2]/) ? 0 : num
  end
end

Trinary.new('2').to_decimal
