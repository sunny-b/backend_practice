=begin
input: num value, it becomes the data point of that value set.
When you insert another value, it becomes the left or right of that point
until those are filled. It then

=end
require 'pry'                       # => true
class Bst
  attr_reader :data, :left, :right  # => nil

  def initialize(num)
    @data = num        # => 4, 2, 1, 6, 7, 5
    @right = nil       # => nil, nil, nil, nil, nil, nil
    @left = nil        # => nil, nil, nil, nil, nil, nil
  end                  # => :initialize

  def insert(num)
    if num <= data             # => true, true, true, false, false, false, false, true
      if @left.nil?            # => true, false, true, true
        @left = Bst.new(num)   # => #<Bst:0x007fd8e91a9f18 @data=2, @right=nil, @left=nil>, #<Bst:0x007fd8e91a1070 @data=1, @right=nil, @left=nil>, #<Bst:0x007fd8e995d408 @data=5, @right=nil, @left=nil>
      else
        left.insert(num)       # => #<Bst:0x007fd8e91a1070 @data=1, @right=nil, @left=nil>
      end                      # => #<Bst:0x007fd8e91a9f18 @data=2, @right=nil, @left=nil>, #<Bst:0x007fd8e91a1070 @data=1, @right=nil, @left=nil>, #<Bst:0x007fd8e91a1070 @data=1, @right=nil, @left=nil>, #<Bst:0x007fd8e995d408 @data=5, @right=nil, @left=nil>
    else
      if @right.nil?           # => true, false, true, false
        @right = Bst.new(num)  # => #<Bst:0x007fd8e9977ee8 @data=6, @right=nil, @left=nil>, #<Bst:0x007fd8e9967098 @data=7, @right=nil, @left=nil>
      else
        right.insert(num)      # => #<Bst:0x007fd8e9967098 @data=7, @right=nil, @left=nil>, #<Bst:0x007fd8e995d408 @data=5, @right=nil, @left=nil>
      end                      # => #<Bst:0x007fd8e9977ee8 @data=6, @right=nil, @left=nil>, #<Bst:0x007fd8e9967098 @data=7, @right=nil, @left=nil>, #<Bst:0x007fd8e9967098 @data=7, @right=nil, @left=nil>, #<Bst:0x007fd8e995d408 @data=5, @right=nil, @left=nil>
    end                        # => #<Bst:0x007fd8e91a9f18 @data=2, @right=nil, @left=nil>, #<Bst:0x007fd8e91a1070 @data=1, @right=nil, @left=nil>, #<Bst:0x007fd8e91a1070 @data=1, @right=nil, @left=nil>, #<Bst:0x007fd8e9977ee8 @data=6, @right=nil, @left=nil>, #<Bst:0x007fd8e9967098 @data=7, @right=nil, @left=nil>, #<Bst:0x007fd8e9967098 @data=7, @right=nil, @left=nil>, #<Bst:0x007fd8e995d408 @data=5, @right=nil, @left=nil>, #<Bst:0x007fd8e995d408 @data=5, @right=nil, @left=nil>
  end                          # => :insert

  def each
    lefty = left.nil? ? left : [left.each].flatten                 # => nil, [1], [1, 2], nil, [5], nil
    righty = right.nil? ? right : [right.each].flatten             # => nil, nil, nil, nil, [7], [5, 6, 7]
    return [lefty, data, righty].flatten.compact if !block_given?  # => true, true, true, true, true, false

    if block_given?                                        # => true
      lefty.each { |num| yield(num) } unless lefty.nil?    # => [1, 2]
      yield(data)                                          # => [1, 2, 4]
      righty.each { |num| yield(num) } unless righty.nil?  # => [5, 6, 7]
    end                                                    # => [5, 6, 7]
  end                                                      # => :each
end                                                        # => :each
all_data = []                                              # => []

bst = Bst.new(4)                      # => #<Bst:0x007fd8e91b0188 @data=4, @right=nil, @left=nil>
bst.insert 2                          # => #<Bst:0x007fd8e91a9f18 @data=2, @right=nil, @left=nil>
bst.insert 1                          # => #<Bst:0x007fd8e91a1070 @data=1, @right=nil, @left=nil>
bst.insert 6                          # => #<Bst:0x007fd8e9977ee8 @data=6, @right=nil, @left=nil>
bst.insert 7                          # => #<Bst:0x007fd8e9967098 @data=7, @right=nil, @left=nil>
bst.insert 5                          # => #<Bst:0x007fd8e995d408 @data=5, @right=nil, @left=nil>
bst.each { |data| all_data << data }  # => [5, 6, 7]
all_data                              # => [1, 2, 4, 5, 6, 7]
