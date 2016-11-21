class Integer
  ROMAN_NUM = { 1...5 => 'I',
                5...10 => 'V',
                10...50 => 'X',
                50...100 => 'L',
                100...500 => 'C',
                500...1000 => 'D',
                1000..3000 => 'M' }.freeze

  def to_roman
    number = self
    string = ''
    loop do
      digits = number.to_s.length - 1
      first_digit, rest = number.divmod(10**digits)
      valid_number = first_digit.zero? ? rest : first_digit
      no_remainder = valid_number * (10**digits)

      string << convert_number(valid_number, digits, no_remainder)

      break if rest.zero? || first_digit.zero?
      number = rest
    end
    string
  end

  private

  def convert_number(valid_number, digits, no_remainder)
    if valid_number < 5
      less_than_5(valid_number, no_remainder)
    else
      greater_than_5(valid_number, digits, no_remainder)
    end
  end

  def less_than_5(valid_number, no_remainder)
    if valid_number == 4
      convert_4(no_remainder)
    else
      convert_less_than_4(valid_number, no_remainder)
    end
  end

  def greater_than_5(valid_number, digits, no_remainder)
    if valid_number == 9
      convert_9(digits, no_remainder)
    else
      convert_less_than_9(valid_number, no_remainder)
    end
  end

  def convert_4(no_remainder)
    range = ROMAN_NUM.keys.select do |key|
      (key.cover?(no_remainder) || key.cover?(no_remainder * 2))
    end
    ROMAN_NUM[range.first] + ROMAN_NUM[range.last]
  end

  def convert_9(digits, no_remainder)
    range = ROMAN_NUM.keys.select do |key|
      (key.cover?(no_remainder / 2) ||
        key.cover?(no_remainder + (10**digits)))
    end
    ROMAN_NUM[range.first] + ROMAN_NUM[range.last]
  end

  def convert_less_than_4(valid_number, no_remainder)
    range = ROMAN_NUM.keys.select { |key| key.cover? no_remainder }
    ROMAN_NUM[range.first] * valid_number
  end

  def convert_less_than_9(valid_number, no_remainder)
    range = ROMAN_NUM.keys.select do |key|
      (key.cover?(no_remainder) || key.cover?(no_remainder / 2))
    end
    ROMAN_NUM[range.last] + (ROMAN_NUM[range.first] * (valid_number - 5))
  end
end
