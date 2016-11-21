class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num <= 0
    total = self.divisors(num).reduce(:+)

    case
    when num == total then 'perfect'
    when num > total  then 'deficient'
    when num < total  then 'abundant'
    end
  end

  def self.divisors(number)
    low = [1]
    high = []
    (2..Math::sqrt(number)).each do |n|
      if number % n == 0
        low.push(n)
        high.unshift(number / n)
      end
    end
    (low + high).uniq
  end
end
