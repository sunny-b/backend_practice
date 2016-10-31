class Box
  @@box_counter = 0

  def initialize(h, w)
    @height, @width = h, w

    @@box_counter += 1
  end

  #Getter Methods
  def get_width
    @width
  end

  def get_height
    @height
  end

  #setter methods
  def set_width=(value)
    @width = value
  end

  def set_height=(value)
    @height = value
  end

  def get_area
    @width * @height
  end

  def self.number_of_boxes
    @@box_counter
  end

  def to_s
    "The width of this box is #{self.get_width} and the height of this box is #{self.get_height}"
  end
end

class BigBox < Box
  def get_area
    @area = @width * @height
    puts "The area of Big Box is #{@area}"
  end
end

box1 = Box.new(10, 20)
box2 = Box.new(1, 1)

p box1.get_width
p box1.get_height
p box1.get_area

box1.set_width = 30
box1.set_height = 50
p box1.get_area

p Box.number_of_boxes

puts box1

big_box1 = BigBox.new(100, 100)
big_box1.get_area

p Box.number_of_boxes
