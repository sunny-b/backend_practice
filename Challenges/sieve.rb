class Sieve
  attr_reader :all_nums  # => nil

  def initialize(end_range)
    @all_nums = (2..end_range).to_a  # => [2, 3, 4, 5, 6, 7, 8, 9, 10]
  end                                # => :initialize

  def primes
    @all_nums.each do |prime|                                        # => [2, 3, 4, 5, 6, 7, 8, 9, 10]
      @all_nums.reject! { |num| (num != prime && num % prime == 0)}  # => [2, 3, 5, 7, 9], [2, 3, 5, 7], nil, nil
    end                                                              # => [2, 3, 5, 7]
    @all_nums                                                        # => [2, 3, 5, 7]
  end                                                                # => :primes
end                                                                  # => :primes

Sieve.new(10).primes  # => [2, 3, 5, 7]
