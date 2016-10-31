module Swimmable
  def swim
    'swimming!'
  end
end

class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Animal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Fish
  include Swimmable
end

class Dog < Animal
  include Swimmable

  def speak
    'bark!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Animal
  def speak
    'meow!'
  end
end

class BullDog < Dog
  def swim
    'can\'t swim!'
  end
end

bob = Person.new('Robert')

kitty = Cat.new
bud = BullDog.new

bob.pets << kitty << bud

bob.pets

bob.pets.first.speak

bob.pets.each {|pet| p pet.jump }

BullDog.ancestors # => [BullDog, Dog, Swimmable, Animal, Object, PP::ObjectMixin, Kernel, BasicObject]

# >> "jumping!"
# >> "jumping!"
