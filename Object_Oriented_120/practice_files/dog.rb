class Animal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Animal
  def speak
    'bark!'
  end

  def swim
    'swimming!'
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

pete = Animal.new
kitty = Cat.new
dave = Dog.new
bud = BullDog.new

pete.run


kitty.run
kitty.speak

dave.speak

bud.run
bud.swim
