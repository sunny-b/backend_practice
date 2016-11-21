class Me
  @@me = 'Sunny'  # => "Sunny"

  def self.call
    @@me         # => "Sunny"
  end            # => :call

  def self.sentence
    puts "Hello, my name is #{self.call} and my class is #{self}"  # => nil
  end                                                              # => :sentence
end                                                                # => :sentence

Me.sentence  # => nil

# >> Hello, my name is Sunny and my class is Me
