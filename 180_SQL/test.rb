class Person
  @persons = 0

  def self.count
    puts "Number of people #{@persons}."
  end

  def self.person_count
    @persons += 1
  end
  attr_accessor :name, :hair, :persons

  def initialize (name, hair_color)
    Person.person_count
    @name = name
    @hair = hair_color
  end

  def greet
    puts "Hello, my name is #{name}."
  end

  def dye_hair(color)
    self.hair = color
  end
end

Person.count # Number of people 0.
tommy = Person.new("Tommy", "Brown")
puts tommy.name # Tommy
puts tommy.hair # Brown
tommy.greet # Hello, my name is Tommy.
tommy.dye_hair("black")
puts tommy.hair # black
puts tommy.persons
Person.count # Number of people 1.
