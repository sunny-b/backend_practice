require 'seeing_is_believing'

module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable
end

class Mammal < Animal
end

class Cat < Animal
end

class Dog < Animal
  include Swimmable
end

sparky = Dog.new
neemo = Fish.new
paws = Cat.new

p sparky.swim
p neemo.swim
p paws.swim
