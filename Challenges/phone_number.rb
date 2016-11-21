=begin
phone_number < 10 - BAD
phone_number == 10 - GOOD

phone_number == 11 && phone_number[0] == 1 - GOOD
phone_number == 11 && phone_number != 1 - BAD

phone_number > 11 - BAD

=end

class PhoneNumber
  BAD_NUMBER = '0000000000'

  def initialize(number)
    @phone_number = evaluate(number)
  end

  def number
    @phone_number
  end

  def area_code
    @phone_number[0, 3]
  end

  def to_s
    "(#{area_code}) #{@phone_number[3, 3]}-#{@phone_number[6, 4]}"
  end

  private

  def evaluate(number)
    return BAD_NUMBER if contains_letters?(number)
    number.gsub!(/[^0-9]/, '')
    number = (valid?(number) ? number : BAD_NUMBER)
    too_long?(number.length) ? number[1..-1] : number
  end

  def valid?(number)
    size = number.length
    size == 10 || (too_long?(size) && number[0] == '1')
  end

  def too_long?(length)
    length == 11
  end

  def contains_letters?(number)
    number.downcase.match(/[a-z]/)
  end
end
