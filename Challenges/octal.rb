class Octal
  OCTAL = 8
  def initialize(num)
    @number = num
  end

  def to_decimal
    return 0 unless verify(@number)

    @number = @number.chars.map(&:to_i)
    exponent = @number.length
    @number.reduce(0) do |acc, num|
      exponent -= 1
      acc += num * (OCTAL ** exponent)
    end
  end

  private

  def verify(num)
    !@number.match(/[^0-7]/)
  end
end
