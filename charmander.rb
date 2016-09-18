game = true

class Charmander

  def initialize name
    @name = name
    @stomach = 10 #full
    @intestine = 0 #empty bowe
    @crankiness = 0 #not cranky
    @asleep = false

    puts "#{@name} is born!"
  end

  def feed
    @stomach = 10
    cheer_up
    puts "You fed #{@name} and now he is full"
    time_passes
  end

  def tuck_in
    @asleep = true
    @crankiness = 0
    puts "You tucked #{@name} into bed and now he is asleep"
    3.times do 
      puts "#{@name}: ZzZzZzZzZzZz"
      time_passes
      if !@asleep
        break
      end
    end
    @asleep = false
    puts "#{@name} slowly opens his eyes and wakes up" unless hungry? || poopy?
  end

  def walk
    @intestine = 0  
    cheer_up
    puts "You take #{@name} for a walk. He leaves a present on your neighbors lawn."
    time_passes
  end

  def fetch
    puts "You toss the ball to #{@name}. He brings it back with singe marks."
    time_passes
  end

  def toss
    puts "You toss #{@name} into the air and he giggles in joy, shooting flames from his nose."
    time_passes
  end

  def scold
    puts "You shout at #{@name} for being a little bitch."
    @crankiness += 1
    time_passes
  end

  private

  def cheer_up
    if @crankiness > 3
      @crankiness -= 3
    else
      @crankiness = 0
    end
  end

  def cranky?
    @crankiness > 7
  end

  def hungry?
    @stomach < 3
  end

  def poopy?
    @intestine > 7
  end
  
  def time_passes
    if @crankiness < 10
      @crankiness +=1
    else
      puts "#{@name} becomes very cranky and scratches you out of frustration."
    end

    if @stomach > 0 
      @stomach -= 1
      @intestine += 1
    else
      if @asleep
        @asleep = false
        puts "#{@name} wakes up with a start!"
      end
      puts "#{@name} is starving. He unleashes a roaring flame from his mouth, burns you alive, and picks the meat off your bones."
      
      exit
    end
    
    if hungry?
      if @asleep
        @asleep = false
        puts "#{@name} wakes up with a start."
      end
      puts "His stomach growls"
    end
    
    if poopy?
      if @asleep
        @asleep = false
        puts "#{@name} wakes up with a start."
      end
      puts "#{@name} does the potty dance."
      if @intestine >= 10
        puts "#{@name} drops a deuce right are your feet because you didn't take him out. Serves you right."
        @intestine = 0
      end
    end

    if cranky?
      puts "#{@name} appears to be growing cranky. He bears his teeth at you and growls."
    end
  end
end

def input
  print "Input a command(feed/walk/toss/fetch/scold/tuck in): "
  command = gets.chomp.downcase.gsub(/\s+/,"")
  return command
end

print "What do you want to name your Charmander? "
pet_name = gets.chomp
inputs = ["feed", "walk", "toss", "fetch", "scold", "tuckin"]
pet = Charmander.new "#{pet_name}"

def input
  print "Input a command(feed/walk/toss/fetch/scold/tuck in): "
  command = gets.chomp.downcase.gsub(/\s+/,"")
  return command
end

while game
  a = input
  case a
  when "feed"
    pet.feed
  when "walk"
    pet.walk
  when "fetch"
    pet.fetch
  when "scold"
    pet.scold
  when "toss"
    pet.toss
  when "tuckin"
    pet.tuck_in
  else
    puts "Invalid command."
  end
end
    
    

#   if inputs.include? input
#     if input == "feed"
#       pet.feed
#     elsif input == "walk"
#       pet.walk
#     elsif input == "toss"
#       pet.toss
#     elsif input == "fetch"
#       pet.fetch
#     elsif input == "scold"
#       pet.scold
#     elsif input == "tuckin"
#       pet.tuck_in
#     else
#       puts "This isn't working"
#     end
#   else
#     puts "Invalid command."
#   end
# end  













