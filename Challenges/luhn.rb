class Luhn
  def initialize(number)
    @numbers = number.to_s.chars.map(&:to_i).reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def convert(number)
    number *= 2
    number > 10 ? (number - 9) : number
  end

  def self.create(number)
    new_num = number * 10
    new_luhn = Luhn.new(new_num)

    new_luhn.valid? ? new_num : new_num + (10 - (new_luhn.checksum % 10))
  end

  def addends
    @numbers.map.with_index do |number, index|
      index.odd? ? convert(number) : number
    end.reverse
  end
end

Luhn.create(873)
