require 'Time'

module Trunk
  def pop_trunk
    puts "You pop the trunk and it swings open."
  end
end

class Vehicle
  @@number_of_objects = 0

  attr_accessor :color
  attr_reader :year, :model

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @off = false
    @@number_of_objects += 1
  end

  def speed_up(num)
    if @off
      puts "Car is shut off, cannot speed up."
    else
      @speed += num
      puts "You push the gas and accelerate #{num} mph"
    end
  end

def brake(num)
    if @off
      puts "Car is already shut off."
    else
      @speed -= num
      puts "You push the brake and decelerate #{num} mph"
    end
  end

  def speed
    puts "You are now going #{@speed} mph"
  end


  def shut_off
    @off = true
    @speed = 0
    puts "Let's park this baby!"
  end

  def turn_on
   @off = false
   puts "You turn on the engine and hear its purrr"
  end

  def spray_paint(clr)
    self.color = clr
    puts "The color of the vehicle is now #{clr}"
  end

  def to_s
    "Your vehicle is a #{@year} #{@color} #{@model}. What a beauty!"
  end
  
  def self.gas_mileage(gas_amount, total_distance)
    mpg = total_distance / gas_amount
    "The gas mileage of your car is #{mpg} mpg"
  end

  def self.number_of_objects
    @@number_of_objects
  end

  def age
    "Your #{self.model} is #{years_old} years old"
  end

  private

  def years_old
    Time.now.year - self.year.to_i
  end
end

class MyCar < Vehicle
  include Trunk

  NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
 
end


ford = MyTruck.new('2002', 'Silver', 'Ford F150')
lumina = MyCar.new('2007', 'red', 'Mazda 6')

ford.speed_up(40)
ford.speed

lumina.speed_up(20)
lumina.speed
lumina.speed_up(20)
lumina.speed
lumina.brake(20)
lumina.speed
lumina.brake(20)
lumina.speed
lumina.shut_off
MyCar.gas_mileage(13, 351)
lumina.spray_paint("red")
puts lumina

puts Vehicle.number_of_objects

puts "----MyTruck Ancestors-----"
puts MyTruck.ancestors

puts "-----MyCar Ancestors------"
puts MyCar.ancestors

p lumina.age