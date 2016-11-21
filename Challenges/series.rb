# class Series
#   def initialize(number)
#     @number_string = number
#   end
#
#   def slices(length)
#     raise ArgumentError if length > @number_string.length
#     start = 0
#     ending = length
#     result_arr = []
#     while ending <= @number_string.length
#       result_arr << @number_string[start...ending].chars.map(&:to_i)
#       start += 1
#       ending += 1
#     end
#     result_arr
#   end
# end


class Series
  def initialize(number_string)
    @number_string = number_string.chars.map(&:to_i)
  end

  def slices(n)
    verify_length(n)
    result_arr = []
    @number_string.each_cons(n) { |arr| result_arr << arr}
    result_arr
  end

  private

  def verify_length(n)
    raise ArgumentError, "Your request is too long" if n > @number_string.size
  end
end
