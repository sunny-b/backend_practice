=begin
height is height, amount of rows. start with [1], pass into function to create next row.

=end


class Triangle
  attr_reader :rows

  def initialize(height)
    triangle_init(height)
  end

  private

  def triangle_init(height)
    @rows = [[1]]
    (height - 1).times do
      @rows << create_row(@rows.last)
    end
  end

  def create_row(last_row)
    last_row.each_cons(2).map { |pair| pair.reduce(:+) }.push(1).unshift(1)
  end
end
