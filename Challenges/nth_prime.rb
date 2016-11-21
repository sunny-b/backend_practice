class Prime
  def self.nth(number)
    raise ArgumentError if number < 1
    return 2 if number == 1
    counter = 1
    poss_prime = 1
    until counter == number
      poss_prime += 2
      counter += 1 if is_prime?(poss_prime)
    end
    poss_prime
  end

  private

  def self.is_prime?(number)
    return true if [2, 3].include? number
    (2..Math.sqrt(number).floor).to_a.all? { |num| number % num != 0 }
  end
end

Prime.nth(3)
