class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

puts Vehicle.wheels

class Motorcycle < Vehicle
  @@wheels = 2
end

puts Motorcycle.wheels
puts Vehicle.wheels

class Car < Vehicle
end

puts Car.wheels
