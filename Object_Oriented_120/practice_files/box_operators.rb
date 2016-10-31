class Box
  attr_accessor :width, :height

  def initialize(w, h)
    @width, @height = w, h
  end

  def +(other)
    Box.new(@width + other.width, @height + other.height)
  end

  def -@
    Box.new(-@width, -@height)
  end

  def *(scalar)
    Box.new(@width * scalar, @height * scalar)
  end

  def get_area
    puts "#{@width} * #{@height} = #{@width * @height}"
  end
end

box1 = Box.new(10, 20)
box2 = box1 * 2
box3 = box1 +(box2)
box4 = -box1

box1.get_area
box2.get_area
box3.get_area
box4.get_area