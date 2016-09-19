class Die

  def initialize
    # I'll just roll the die, though we
    # could do something else if we wanted
    # to, like setting the die with 6 showing.
    roll
  end

  def roll
    @numberShowing = 1 + rand(6)
  end

  def showing
    @numberShowing
  end

  def set number
   if number > 6
    @numberShowing = 6
   elsif number < 1
    @numberShowing = 1
   else 
    @numberShowing = number
   end
  end
end

die = Die.new
puts die.showing
die.set(7)
puts die.showing